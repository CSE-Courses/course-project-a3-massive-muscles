import functools
import datetime
import json
from .models import BMI, User, Calorie
from .app import db, bcrypt
from .forms import RegistrationForm, LoginForm
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash
from flask_login import login_user, current_user, logout_user, login_required

bp = Blueprint('web', __name__, url_prefix='/web')
import random


@bp.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(username=form.username.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash(f'Account created for {form.username.data}, now you are able to log in', 'success')
        return redirect(url_for("web.login"))
    return render_template('web/register.html', title='Register', form=form)


@bp.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user and bcrypt.check_password_hash(user.password, form.password.data):
            login_user(user, remember=form.remember.data)
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('web.home'))
        else:
            flash(f'Login Unsuccessful. Please check email and password!', 'danger')
    return render_template('web/login.html', title='Login', form=form)


@bp.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('home'))


@bp.route('/')
def home():
    return render_template('web/index.html')


@bp.route('/health')
@login_required
def healthTracker():
    return render_template('web/healthTracker.html')


@bp.route('/profile')
@login_required
def profile():
    return render_template('web/profile.html')


@bp.route('/forum')
@login_required
def forum():
    return render_template('web/forum.html')


@bp.route('/edit')
@login_required
def edit():
    return render_template('web/edit.html')


@bp.route('/exercises')
@login_required
def exercises():
    return render_template('web/exercises.html')


@bp.route('/timer')
@login_required
def timer():
    return render_template('web/timer.html')


@bp.route('profile/generateData')
@login_required
def profile_data_generator():
    for month in range(1, 13):
        measurement = random.randint(25, 28)
        bmi = BMI(user_id=current_user.id,
                  measurement=measurement,
                  date=datetime.datetime(2020, month, 1)
                  )
        db.session.add(bmi)
        db.session.commit()
    for day in range(1, 31):
        measurement = random.randint(2000, 3000)
        calorie = Calorie(user_id=current_user.id,
                          measurement=measurement,
                          date=datetime.datetime(2020, 10, day)
                          )
        db.session.add(calorie)
        db.session.commit()
    return render_template('web/profile.html')


@bp.route('profile/get_data')
@login_required
def profile_data():
    replay = {}
    user = User.query.filter_by(username=current_user.username).first()
    bmi_data = user.BMIs
    calorie_data = user.calories
    bmi_data_list = {}
    calorie_data_list = {}
    if len(bmi_data) != 0 or len(calorie_data) != 0:
        for index in range(0, 12):
            bmi = bmi_data[index]
            date = datetime.datetime.strftime(bmi.date.date(), "%m")
            bmi_data_list[date] = bmi.measurement
        for index in range(0, 30):
            cal = calorie_data[index]
            date = datetime.datetime.strftime(cal.date.date(), "%m/%d")
            calorie_data_list[date] = cal.measurement
    replay["BMI"] = bmi_data_list
    replay["Calories"] = calorie_data_list
    json_msg = json.dumps(replay)
    return json_msg
