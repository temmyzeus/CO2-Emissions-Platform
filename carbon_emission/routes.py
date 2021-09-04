from . import app
from flask import render_template
from dash_application import create_dash_application

create_dash_application(app)

@app.route("/", methods=['GET'])
@app.route("/home", methods=['GET'])
@app.route("/index", methods=['GET'])
def index():
	return '<h2>Homepage</h2>'