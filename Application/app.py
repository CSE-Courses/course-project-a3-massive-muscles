import os
import tempfile
from flask_sqlalchemy import SQLAlchemy
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, Flask
)
from flask_bcrypt import Bcrypt
from flask_login import LoginManager

# links app database to SQLAlchemy for data modeling
db = SQLAlchemy()
bcrypt = Bcrypt()
login_manager = LoginManager()


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(SECRET_KEY='muscles',
                            SQLALCHEMY_DATABASE_URI='sqlite:///' +
                            os.path.join(tempfile.mkdtemp(), 'server.sqlite'),
                            SQLALCHEMY_TRACK_MODIFICATIONS=False)

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

    # initializes the database and the login manager to manage the user session
    with app.app_context():
        import Application.models as _
        db.init_app(app)
        db.drop_all()
        db.create_all()

    bcrypt.init_app(app)
    login_manager.init_app(app)

    # redirects the unauthenticated user to the login page
    login_manager.login_view = 'web.login'
    login_manager.login_message_category = 'warning'
    from Application import web
    app.register_blueprint(web.bp)

    return app
