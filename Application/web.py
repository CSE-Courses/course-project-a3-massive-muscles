import functools
from datetime import datetime
import json
from .models import BMI

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


@bp.route('profile/get_data')
def profile_data():
    replay = {}
    BMI_list = BMI.query.all()
    bmi_data = {}
    for bmi in BMI_list:
        date = datetime.strftime(bmi.date.date(), "%m_%d_%Y")
        bmi_data[date] = bmi.measurement
    replay["BMI"] = bmi_data
    json_msg = json.dumps(replay)
    return json_msg
