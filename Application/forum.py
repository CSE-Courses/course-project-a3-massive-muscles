from flask import jsonify, request

import Application.models as DBModels
from Application.app import db

# Error codes
MISSING_USER_ID = 1
MISSING_POST_CONTENT = 2
INVALID_THREAD_ID = 3

# Constants
LATEST_THREAD_COUNT = 10
MAXIMUM_POST_CHARACTERS = 1000

# Shitty tracking implementing
_post_counter = 0
_thread_counter = 0


def forum_error(code, msg):
    return {"err_code": code, "err": msg}


# ASSUMPTIONS:
#   Everything is passed through JSON, fuck up and it's not my problem


def _get_params():
    request.get_json(force=True, cache=False)
    return request.json


def create():
    global _post_counter
    global _thread_counter  # 99% certain there's a better way but first google
    """
    - user_id (optional, defaults to -1)
    - content (thread content)
    """
    params = _get_params()

    print("Creating thread ...")
    # if "user_id" not in params:
    #     return jsonify(forum_error(MISSING_USER_ID, "INVALID USER ID"))
    if "content" not in params or len(
            params.content) > MAXIMUM_POST_CHARACTERS:
        return jsonify(forum_error(MISSING_POST_CONTENT, "INVALID CONTENT"))

    db.session.add(
        DBModels.Forum(post_id=_post_counter, user_id=params.user_id or -1))
    db.session.add(
        DBModels.Thread(thread_id=_thread_counter, post_id=_post_counter))
    db.session.add(DBModels.Post(post_id=_post_counter,
                                 content=params.content))

    _post_counter = _post_counter + 1
    _thread_counter = _thread_counter + 1
    db.session.commit()
    """
    - thread_id
    """
    return _thread_counter - 1


def create_post():
    global _post_counter
    """
    - user_id (optional, defaults to -1)
    - content (post content)
    """
    params = _get_params()

    print("Creating post ...")
    if "content" not in params or len(
            params.content) > MAXIMUM_POST_CHARACTERS:
        return jsonify(forum_error(MISSING_POST_CONTENT, "INVALID CONTENT"))

    db.session.add(
        DBModels.Forum(post_id=_post_counter, user_id=params.user_id or -1))
    db.session.add(
        DBModels.Forum(post_id=_post_counter, content=params.content))

    _post_counter = _post_counter + 1
    db.session.commit()


def latest():
    print("Fetching latest threads ...")
    threads_collection = DBModels.Thread.query\
        .join(DBModels.Post, DBModels.Thread.post_id == DBModels.Post.post_id)\
        .filter(DBModels.Thread.post_id == DBModels.Post.post_id)\
        .order_by(DBModels.Post.time).limit(LATEST_THREAD_COUNT).all()
    """
    Most recent (up to 10) threads created

    - Array of threads of the following form
        - thread_id
        - content (first post in the thread's content
    """
    return jsonify(threads_collection[1])


def get_thread(thread_id):
    global _thread_counter
    print(f"Getting thread with id {thread_id} ...")
    if thread_id >= _thread_counter:
        return jsonify(forum_error(INVALID_THREAD_ID, "INVALID THREAD ID"))

    threads_collection = DBModels.Thread.query\
        .join(DBModels.Forum, DBModels.Thread.post_id == DBModels.Forum.post_id)\
        .join(DBModels.Post, DBModels.Thread.post_id == DBModels.Post.post_id)\
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
    return jsonify(
        threads_collection[1, :])  # We don't care about DBModels.Thread now
