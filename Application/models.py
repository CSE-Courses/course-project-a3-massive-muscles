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
