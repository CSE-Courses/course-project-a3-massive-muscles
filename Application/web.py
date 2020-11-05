import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

bp = Blueprint('web', __name__, url_prefix='/web')


@bp.route('/login')
def login():
    return render_template('web/login.html')


@bp.route('/')
def home():
    return render_template('web/index.html')


@bp.route('/health')
def healthTracker():
    return render_template('web/healthTracker.html')


@bp.route('/profile')
def profile():
    return render_template('web/profile.html')


@bp.route('/forum')
def forum():
    return render_template('web/forum.html')


@bp.route('/edit')
def edit():
    return render_template('web/edit.html')


@bp.route('/exercises')
def exercises():
    return render_template('web/exercises.html')


@bp.route('/timer')
def timer():
    return render_template('web/timer.html')































































@bp.route('/contactPage')
def contactPage():
    return render_template('web/contactPage.html')









