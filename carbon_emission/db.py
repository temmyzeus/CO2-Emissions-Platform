import sqlite3
from sqlite3.dbapi2 import PARSE_DECLTYPES
import click
from flask import current_app, g
from flask.cli import with_appcontext

def get_db():
    '''Create Connection to SQLITE Database'''
    if 'db' in g:
        g.db = sqlite3.connect(
            database=current_app.config['DATABASE'],
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row

    return g.db

def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

def init_db():
    db = get_db()

    with current_app.open_instance_resource('carbon_emission.sql') as f:
        db.executescript(f.read().decode('utf8'))

@click.command('init_db')
@with_appcontext
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')

def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)