from Application.app import db, create_app
from Application.models import User

def rest_database():
    with create_app().app_context():
        db.drop_all()
        print(f'database tables are dropped')
        db.create_all()
        print(f'New database tables are created')


rest_database()
