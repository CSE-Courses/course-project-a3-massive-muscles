import os
from flask_sqlalchemy import SQLAlchemy
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, Flask
)


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='muscles',
        SQLALCHEMY_DATABASE_URI='sqlite:///server.db',
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route('/')
    def home():
        return render_template('web/index.html')

    from Application import web
    app.register_blueprint(web.bp)

    return app


# links app database to SQLAlchemy for data modeling
db = SQLAlchemy(app=create_app())
