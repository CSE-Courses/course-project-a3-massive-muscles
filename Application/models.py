from .app import db
from datetime import datetime


# creates a table for BMI data
# key: is the date of submission
# measurement: measurement to be uploaded
class BMI(db.Model):
    date = db.Column(db.DateTime, nullable=False,default=datetime.utcnow, primary_key=True)
    measurement = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f"BMI({self.date}, {self.measurement})"


# creates a table for Calories data
# key: is the date of submission
# measurement: measurement to be uploaded
class Calories(db.Model):
    date = db.Column(db.DateTime, nullable=False,default=datetime.utcnow, primary_key=True)
    measurement = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f"Calories({self.date}, {self.measurement})"


# creates a table for Steps data
# key: is the date of submission
# measurement: measurement to be uploaded
class Steps(db.Model):
    date = db.Column(db.DateTime, nullable=False,default=datetime.utcnow, primary_key=True)
    measurement = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f"Steps({self.date}, {self.measurement})"


# Forum

class Forum(db.Model):
    post_id = db.Column(db.Integer, nullable=False, primary_key=True)
    user_id = db.Column(db.Integer, nullable=False)

class Thread(db.Model):
    thread_id = db.Column(db.Integer, nullable=False, primary_key=True)
    post_id = db.Column(db.Integer, nullable=False)

class Post(db.Model):
    post_id = db.Column(db.Integer, nullable=False, primary_key=True)
    time = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    content = db.Column(db.UnicodeText, nullable=False)
