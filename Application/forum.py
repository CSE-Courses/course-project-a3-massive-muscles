from time import time

from flask import jsonify, request

import Application.models as DBModels
from Application.app import db

# Error codes
MISSING_USER_ID = 1
MISSING_POST_CONTENT = 2
INVALID_THREAD_ID = 3
MISSING_THREAD_ID = 4

# Constants
LATEST_THREAD_COUNT = 10
MAXIMUM_POST_CHARACTERS = 1000

# Shitty non-persistant tracking implementation
_post_counter = 0
_thread_counter = 0


def forum_error(code, msg):
    print(jsonify({"timestamp": time(), "err_code": code, "err": msg}))
    return {"timestamp": time()}


# ASSUMPTIONS:
#   Everything is passed through JSON, fuck up and it's not my problem


def _get_params():
    return request.get_json(force=True, cache=False) or {}


def create():
    global _post_counter
    global _thread_counter  # 99% certain there's a better way but first google
    """
    - user_id (optional, defaults to -1)
    - content (thread content)
    """
    params = _get_params()

    print("Creating thread ...")
    if "content" not in params or len(
            params["content"]) > MAXIMUM_POST_CHARACTERS or len(
                params["content"]) == 0:
        return forum_error(MISSING_POST_CONTENT, "INVALID CONTENT")

    user_id = params["user_id"] if "user_id" in params else -1
    thread_id = _thread_counter
    post_id = _post_counter
    db.session.add(DBModels.Forum(post_id=post_id, user_id=user_id))
    db.session.add(DBModels.Thread(thread_id=thread_id, post_id=post_id))
    db.session.add(DBModels.Post(post_id=post_id, content=params["content"]))

    _post_counter = _post_counter + 1
    _thread_counter = _thread_counter + 1
    db.session.commit()
    """
    - thread_id
    """
    return {"thread_id": thread_id}


def create_post():
    global _post_counter
    global _thread_counter
    """
    - user_id (optional, defaults to -1)
    - content (post content)
    - thread_id
    """
    params = _get_params()

    print("Creating post ...")
    if "content" not in params or len(
            params["content"]) > MAXIMUM_POST_CHARACTERS or len(
                params["content"]) == 0:
        return forum_error(MISSING_POST_CONTENT, "INVALID CONTENT")
    if "thread_id" not in params or params["thread_id"] > _thread_counter:
        return forum_error(MISSING_THREAD_ID, "MISSING THREAD ID")

    user_id = params["user_id"] if "user_id" in params else -1
    post_id = _post_counter
    db.session.add(DBModels.Forum(post_id=post_id, user_id=user_id))
    db.session.add(
        DBModels.Thread(thread_id=params["thread_id"], post_id=post_id))
    db.session.add(DBModels.Post(post_id=post_id, content=params["content"]))

    _post_counter = _post_counter + 1
    db.session.commit()
    """
    - thread_id
    - post_id
    """
    return {"thread_id": params["thread_id"], "post_id": post_id}


def latest():
    print("Fetching latest threads ...")
    # Tuple of the form <Forum, Thread, Post)
    threads_collection = db.session\
        .query(DBModels.Forum, DBModels.Thread, DBModels.Post)\
        .filter(DBModels.Forum.post_id == DBModels.Thread.post_id)\
        .filter(DBModels.Post.post_id == DBModels.Thread.post_id)\
        .order_by(DBModels.Post.time)\
        .limit(LATEST_THREAD_COUNT).all()
    """
    Most recent (up to 10) threads created

    - Array of threads of the following form
        - thread_id
        - content (first post in the thread's content
    """
    return list(
        map(
            lambda x: {
                "thread_id": x[1].thread_id,
                "content": x[2].content,
                "user_id": x[0].user_id
            }, threads_collection))


def get_thread(thread_id):
    global _thread_counter
    print(f"Getting thread with id {thread_id} ...")
    if thread_id >= _thread_counter:
        return forum_error(INVALID_THREAD_ID, "INVALID THREAD ID")

    # At this point I just questioned why I separated them in the first place
    threads_collection = db.session\
        .query(DBModels.Forum, DBModels.Thread, DBModels.Post)\
        .filter(DBModels.Forum.post_id == DBModels.Thread.post_id)\
        .filter(DBModels.Post.post_id == DBModels.Thread.post_id)\
        .filter(DBModels.Thread.thread_id == thread_id)\
        .order_by(DBModels.Post.time)\
        .all()
    """
    All posts in the thread

    - Array of posts of the following form
    - user_id
    - time[ of post]
    - content[ of post]
    """
    return list(
        map(
            lambda x: {
                "user_id": x[0].user_id,
                "time": x[2].time,
                "content": x[2].content
            }, threads_collection))
