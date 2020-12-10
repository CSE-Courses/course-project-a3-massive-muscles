from time import time

from flask import g, jsonify, request
from flask_login import current_user

import Application.models as DBModels
from Application.app import db
from Application.models import Statistics
from Application.web import bp

MAXIMUM_ENTRIES = 100


def pre_req():
    g.req_tick = time()  # Track request "latency"


def post_req(response):
    tick = time()
    req_latency = tick - g.req_tick
    db.session.add(DBModels.RequestLatency(latency=req_latency))

    user_id = current_user.get_id() if current_user.is_authenticated else -1
    db.session.add(
        DBModels.Statistics(user_id=user_id,
                            url=request.url,
                            path=request.path,
                            protocol=request.method,
                            user_agent=request.user_agent.string))

    db.session.commit()
    return response


@bp.route('/api/statistics')
def get_statistics():
    print("Fetching latest statistics ...")
    statistics_collection = db.session\
        .query(DBModels.Statistics)\
        .order_by(DBModels.Statistics.event_id.desc())\
        .limit(MAXIMUM_ENTRIES).all()
    statistics_list = list(
        map(
            lambda x: {
                "user_id": x.user_id,
                "url": x.url,
                "path": x.path,
                "protocol": x.protocol,
                "user_agent": x.user_agent
            }, statistics_collection))

    return jsonify(statistics_list)


@bp.route('/api/statistics/<int:user_id>')
def get_user_statistics(user_id):
    print(f"Fetching latest statistics for user {user_id} ...")
    statistics_collection = db.session\
        .query(DBModels.Statistics)\
        .filter(DBModels.Statistics.user_id == user_id)\
        .order_by(DBModels.Statistics.event_id.desc())\
        .limit(MAXIMUM_ENTRIES).all()
    statistics_list = list(
        map(
            lambda x: {
                "url": x.url,
                "path": x.path,
                "protocol": x.protocol,
                "user_agent": x.user_agent
            }, statistics_collection))

    return jsonify(statistics_list)


@bp.route('/api/metrics')
def get_metrics():
    print("Fetching latest metrics ...")
    latency_collection = db.session\
        .query(DBModels.RequestLatency)\
        .order_by(DBModels.RequestLatency.time)\
        .limit(MAXIMUM_ENTRIES).all()
    """
    Most recent (up to 100) request latencies

    - Array of the following form
        - request_id
        - latency
    """
    latency_list = list(
        map(lambda x: {
            "request_id": x.request_id,
            "latency": x.latency
        }, latency_collection))

    return jsonify(latency_list)
