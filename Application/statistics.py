from time import time_ns

from flask import g, request
from flask_login import current_user

import Application.models as DBModels
from Application.app import db


def pre_req():
    g.req_tick = time_ns()  # Track request "latency"


def post_req(response):
    tick = time_ns()
    req_latency = g.req_tick - tick
    db.session.add(DBModels.RequestLatency(latency=req_latency))

    user_id = current_user.get_id() if current_user.is_authenticated else -1
    db.session.add(
        DBModels.Statistics(user_id=user_id,
                            url=request.url,
                            path=request.path,
                            protocol=request.method,
                            user_agent=request.user_agent))

    db.session.commit()
    return response
