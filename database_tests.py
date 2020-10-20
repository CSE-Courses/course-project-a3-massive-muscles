from Application.app import db
from Application.models import BMI


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

