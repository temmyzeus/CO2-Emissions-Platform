from . import app
from flask import render_template
from dash_application import create_dash_application, create_dash_locations

create_dash_application(app)
create_dash_locations(app)

@app.route("/", methods=['GET'])
@app.route("/home", methods=['GET'])
@app.route("/index", methods=['GET'])
def index():
	return render_template('index.html')