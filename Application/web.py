import functools
import json
import datetime
import Application.forum as FAPI

from flask_login import current_user, login_required, login_user, logout_user
from flask import (
    Blueprint, abort, flash, g, jsonify, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from .app import bcrypt, db
from .forms import LoginForm, RegistrationForm, EditProfileForm
from .models import BMI, User, Calorie, Nutrition

bp = Blueprint('web', __name__, url_prefix='/web')
import random, secrets, os
from PIL import Image


@bp.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(
            form.password.data).decode('utf-8')
        user = User(username=form.username.data,
                    email=form.email.data,
                    password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash(
            f'Account created for {form.username.data}, now you are able to log in',
            'success')
        return redirect(url_for("web.login"))
    return render_template('web/register.html', title='Register', form=form)


@bp.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user and bcrypt.check_password_hash(user.password,
                                               form.password.data):
            login_user(user, remember=form.remember.data)
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(
                url_for('web.home'))
        else:
            flash(f'Login Unsuccessful. Please check email and password!',
                  'danger')
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
    photo = url_for('static', filename=f'profile_pics/{current_user.image_file}')
    return render_template('web/profile.html', photo=photo)


def save_photo(form_photo):
    random_hex = secrets.token_hex(8)
    _, file_ext = os.path.splitext(form_photo.filename)
    photo_filename = random_hex + file_ext
    _dir_ = os.path.dirname(os.path.realpath(__file__))
    _root_ = os.path.join(_dir_)
    picture_path = os.path.join(_root_, 'static/profile_pics', photo_filename)
    output_size = (250, 250)
    i = Image.open(form_photo)
    i.thumbnail(output_size)
    i.save(picture_path)
    return photo_filename


@bp.route('/edit', methods=['GET', 'POST'])
@login_required
def edit():
    photo = url_for('static', filename=f'profile_pics/{current_user.image_file}')
    edit_profile_form = EditProfileForm()
    if edit_profile_form.validate_on_submit():
        if edit_profile_form.photo.data:
            photo_filename = save_photo(edit_profile_form.photo.data)
            current_user.image_file = photo_filename
        current_user.username = edit_profile_form.username.data
        current_user.email = edit_profile_form.email.data
        current_user.about = edit_profile_form.about.data
        if edit_profile_form.new_password.data == '':
            current_user.password = current_user.password
        else:
            current_user.password = bcrypt.generate_password_hash(edit_profile_form.new_password.data).decode('utf-8')
        db.session.commit()
        flash('your account data has been updated!', 'success')
        return redirect(url_for('web.profile'))
    elif request.method == 'GET':
        edit_profile_form.username.data = current_user.username
        edit_profile_form.email.data = current_user.email
        edit_profile_form.about.data = current_user.about
        edit_profile_form.new_password.data = current_user.password
        edit_profile_form.confirm_password.data = current_user.password
    return render_template('web/edit.html', title='Edit page', photo=photo,
                           edit_profile_form=edit_profile_form)


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


@bp.route('/add_and_get_entries', methods=['GET', 'POST'])
@login_required
def nutrition_data():
    # Get reqest
    # Gets all food items from the current user and sends them back to the JavaScript file
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
    # Post reqest
    # Takes a food item and stores it into the database under the current user
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
        nutrition_entry = Nutrition(description=description, calories=calories, fat=fat, carbs=carbs, protein=protein,
                                    user_id=current_user.id)
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
    entry = Nutrition.query.filter_by(id=id, description=description).first()
    print(entry)
    db.session.delete(entry)
    db.session.commit()
    return 'OK', 200


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


@bp.route('/forum')
def forum():
    return render_template('web/forum/forum.j2', threads=FAPI.latest())


@bp.route('/forum/create')
def forum_create():
    return render_template('web/forum/create.html')


@bp.route('/forum/thread/<int:thread_id>')
def forum_thread(thread_id):
    thread_contents = FAPI.get_thread(thread_id)
    return abort(404) if "timestamp" in thread_contents else render_template(
        'web/forum/thread.j2', posts=thread_contents)


@bp.route('/forum/api/create', methods=['POST'])
def forum_api_create():
    response = FAPI.create()
    return jsonify({
        "redirect":
            url_for("web.forum_thread", thread_id=response["thread_id"])
    }) if "thread_id" in response else jsonify(response)


@bp.route('/forum/api/post', methods=['POST'])
def forum_api_create_post():
    response = FAPI.create_post()
    return jsonify({
        "redirect":
            url_for("web.forum_thread", thread_id=response["thread_id"])
    }) if "thread_id" in response else jsonify(response)


@bp.route('/forum/api/latest', methods=['GET'])
def forum_api_latest_threads():
    return jsonify(FAPI.latest())


@bp.route('/forum/api/thread/<int:thread_id>', methods=['GET'])
def forum_api_thread(thread_id):
    return jsonify(FAPI.get_thread(thread_id))
