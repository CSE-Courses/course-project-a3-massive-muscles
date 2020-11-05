import functools
from datetime import datetime
import json
from .models import BMI, User
from .app import db, bcrypt
from .forms import RegistrationForm, LoginForm
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash
from flask_login import login_user, current_user, logout_user, login_required
bp = Blueprint('web', __name__, url_prefix='/web')


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

@bp.route('/music')
@login_required
def musicPlayer():
    return render_template('web/musicPlayer.html')

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


@bp.route('profile/get_data')
@login_required
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
