import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

bp = Blueprint('web', __name__, url_prefix='/web')


@bp.route('/web')
def login():
    return render_template('web/login.html')
