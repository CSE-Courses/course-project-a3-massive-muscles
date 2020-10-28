from Application.app import db, create_app
from Application.models import BMI, Calories, Steps
import time

with create_app().app_context():
    def create_data(data_type, data):
        db.create_all()
        if data_type == 'BMI':
            BMI_1 = BMI(measurement=data)
            print(BMI_1)
            db.session.add(BMI_1)
            db.session.commit()
            print(f"The BMI table: {BMI.query.all()}\n")
        elif data_type == 'Calories':
            calorie_1 = Calories(measurement=data)
            print(calorie_1)
            db.session.add(calorie_1)
            db.session.commit()
            print(f"The Calories table: {Calories.query.all()}\n")
        elif data_type == 'Steps':
            step_1 = Steps(measurement=data)
            print(step_1)
            db.session.add(step_1)
            db.session.commit()
            print(f"The Steps table: {Steps.query.all()}\n")


    create_data('BMI', 28)
    time.sleep(3)
    create_data('Calories', 2300)
    time.sleep(3)
    create_data('Steps', 1000)
