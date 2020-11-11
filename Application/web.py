import functools
from datetime import datetime
import json
from .models import BMI, User, Nutrition
from .app import db, bcrypt
from .forms import RegistrationForm, LoginForm
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, jsonify
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


@bp.route('/contactPage')
def contactPage():
    return render_template('web/contactPage.html')


@bp.route('/add_and_get_entries', methods=['GET', 'POST'])
@login_required
def nutrition_data():
    #Get reqest
    #Gets all food items from the current user and sends them back to the JavaScript file
    if request.method == "GET":
        nutrition_object = {}
        for i in range(len(current_user.nutrition_intake)):
            curr_nutrient_object = {}
            curNutrient = current_user.nutrition_intake[i]
            curr_nutrient_object['id'] = curNutrient.id
            curr_nutrient_object['description'] = curNutrient.description
            curr_nutrient_object['calories'] = curNutrient.calories
            curr_nutrient_object['fat'] = curNutrient.fat
            curr_nutrient_object['carbs'] = curNutrient.carbs
            curr_nutrient_object['protein'] = curNutrient.protein
            nutrition_object['item ' + str(i)] = curr_nutrient_object
        return json.dumps(nutrition_object)
    #Post reqest
    #Takes a food item and stores it into the database under the current user
    else:
        data = json.loads(request.form['entry'])
        description = str(data['description'])
        calories = int(data['calories'])
        fat = int(data['fat'])
        carbs = int(data['carbs'])
        protein = int(data['protein'])
        if len(description) > 200:
            return 'Method Not Allowed', 405
        if calories > 10000 or fat > 10000 or carbs > 10000 or protein > 10000:
            return 'Method Not Allowed', 405
        nutrition_entry = Nutrition(description=description, calories=calories, fat=fat, carbs=carbs, protein=protein, user_id=current_user.id)
        db.session.add(nutrition_entry)
        db.session.commit()
        return 'OK', 200

@bp.route('/delete_entries', methods=['POST'])
@login_required
def delete_entry():
    data = json.loads(request.form['entry'])
    id = int(data['id'])
    description = str(data['description'])
    calories = int(data['calories'])
    fat = int(data['fat'])
    carbs = int(data['carbs'])
    protein = int(data['protein'])
    if len(description) > 200:
        return 'Method Not Allowed', 405
    if calories > 10000 or fat > 10000 or carbs > 10000 or protein > 10000:
        return 'Method Not Allowed', 405
    entry = Nutrition.query.filter_by(id=id,description=description).first()
    print(entry)
    db.session.delete(entry)
    db.session.commit()
    return 'OK', 200
        



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
