from Application.app import db, create_app, bcrypt
from Application.models import User, BMI, Calorie
from sqlalchemy import or_
import time
import datetime


def create_user_test(username, email, password):
    with create_app().app_context():
        # Filters the users by username or email address
        user = db.session.query(User).filter(or_(User.username.like(username),
                                                 User.email.like(email)
                                                 )
                                             ).first()
        # If the user by exist prints the user exist
        if user:
            print(f'User: {user.username} already exist')
            print(f'------------' + '-' * len(user.password))
            print(f'Id: {user.id}')
            print(f'username: {user.username}')
            print(f'email: {user.email}')
            print(f'password: {user.password}')
            print(f'BMIs: {user.BMIs}')
            print(f'------------' + '-' * len(user.password) + '\n')
            return user
        # Else if the user doesn't exist, it creates a user and and fetches it to be displayed
        else:
            hashed_password = bcrypt.generate_password_hash(password)
            user = User(username=username, email=email, password=hashed_password)
            db.session.add(user)
            db.session.commit()
            user = User.query.filter_by(username=username).first()
            print(f'User {user.username} created')
            print(f'------------' + '-' * len(user.password))
            print(f'Id: {user.id}')
            print(f'username: {user.username}')
            print(f'email: {user.email}')
            print(f'------------' + '-' * len(user.password) + '\n')
            return user


def create_BMI_test(username, measurement):
    with create_app().app_context():
        # Filters the users by username or email address
        user = User.query.filter_by(username=username).first()
        # If the user by exist prints the user exist
        if user:
            bmi = BMI(user_id=user.id, measurement=measurement, date=datetime.datetime(2020, 10, 1))
            db.session.add(bmi)
            db.session.commit()
            bmi = BMI.query.filter_by(user_id=user.id).all()
            print(f'------------')
            print(f'BMI data for {user.username} created')
            print(f'{user.username} BMIs: {bmi}')
            print(f'------------\n')


def create_calorie_test(username, measurement):
    with create_app().app_context():
        # Filters the users by username or email address
        user = User.query.filter_by(username=username).first()
        # If the user by exist prints the user exist
        if user:
            cal = Calorie(user_id=user.id, measurement=measurement, date=datetime.datetime(2020, 10, 1))
            db.session.add(cal)
            db.session.commit()
            cal = Calorie.query.filter_by(user_id=user.id).all()
            print(f'------------')
            print(f'BMI data for {user.username} created')
            print(f'{user.username} BMIs: {cal}')
            print(f'------------\n')


user1 = create_user_test('Joe', 'Joe@company.com', 'test')
create_BMI_test('Joe', 25)
user2 = create_user_test('Tom', 'Tom@company.com', 'test')
create_BMI_test('Tom', 25)
create_calorie_test('Tom', 2300)