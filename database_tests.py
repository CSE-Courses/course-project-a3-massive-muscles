from Application.app import db, create_app, bcrypt
from Application.models import BMI, Calories, Steps, User
import time

with create_app().app_context():
    users = User.query.all()
    print(users)

