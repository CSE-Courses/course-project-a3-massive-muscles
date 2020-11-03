from .app import db, login_manager
from datetime import datetime
from flask_login import UserMixin


@login_manager.user_loader
def loader_user(user_id):
    return User.query.get(int(user_id))


class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    image_file = db.Column(db.String(20), nullable=False, default='default.jpg')
    password = db.Column(db.String(60), nullable=False)
    BMIs = db.relationship('BMI', backref='user', lazy=True)

    def __repr__(self):
        return f"User('{self.username}', '{self.email}', '{self.image_file}')"


# creates a table for BMI data
# key: is the date of submission
# measurement: measurement to be uploaded
class BMI(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)
    measurement = db.Column(db.Integer, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return f"BMI({self.date}, {self.measurement})"

#
# # creates a table for Calories data
# # key: is the date of submission
# # measurement: measurement to be uploaded
# class Calories(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     date = db.Column(db.DateTime, default=datetime.utcnow, primary_key=True, nullable=False)
#     measurement = db.Column(db.Integer, nullable=False)
#     calories_author = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
#
#     def __repr__(self):
#         return f"Calorie({self.date}, {self.measurement})"
#
#
# # creates a table for Steps data
# # key: is the date of submission
# # measurement: measurement to be uploaded
# class Steps(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     date = db.Column(db.DateTime, default=datetime.utcnow, primary_key=True, nullable=False)
#     measurement = db.Column(db.Integer, nullable=False)
#     steps_author = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
#
#     def __repr__(self):
#         return f"Steps({self.date}, {self.measurement})"
