from flask_wtf import FlaskForm
from wtforms.fields.html5 import DateField
from wtforms import SubmitField, SelectField, IntegerField
from wtforms.validators import InputRequired, NumberRange
from pathlib import Path
import beitech_app
import beitech_app.database as dbman
import json

with open(
    Path(beitech_app.__file__).parent.joinpath("settings.json"), "r"
) as json_file:
    settings = json.load(json_file)["service"]
host = settings["host"]
port = settings["port"]


class OrdersForm(FlaskForm):
    """Orders form."""

    customers = dbman.get_customers()
    customer_id = SelectField(
        "Cliente",
        [InputRequired(message="Se requiere de un cliente")],
        coerce=int,
        choices=[(item["customer_id"], item["name"]) for item in customers],
    )
    bdate = DateField(
        "Fecha inicial",
        [InputRequired(message="Se requiere de una fecha inicial de búsqueda")],
    )
    edate = DateField(
        "Fecha final",
        [InputRequired(message="Se requiere de una fecha final de búsqueda")],
    )
    submit = SubmitField("Submit")


class CreateForm(FlaskForm):
    customers = dbman.get_customers()
    customer_id = SelectField(
        "Cliente",
        [InputRequired(message="Se requiere ingresar el cliente")],
        coerce=int,
        choices=[(item["customer_id"], item["name"]) for item in customers],
        default=1
    )
    creation_date = DateField(
        "Fecha de creación",
        [InputRequired(message="Se requiere ingresar fecha de creación")],
    )

    pr_choices = [(item["product_id"], item["name"]) for item in dbman.get_customer_products(1)]

    product_id_1 = SelectField(
        "Producto 1",
        [InputRequired(message="Se requiere al menos un producto")],
        coerce=int, choices=pr_choices
    )
    quantity_1 = IntegerField(
        "Cantidad 1",
        [
            InputRequired(message="Se requiere al menos una cantidad"),
            NumberRange(min=0, max=1e9),
        ],
        description="Unidades de producto 1",
    )
    product_id_2 = SelectField("Producto 2", coerce=int, choices=pr_choices)
    quantity_2 = IntegerField(
        "Cantidad 2",
        [NumberRange(min=0, max=1e9)],
        description="Unidades de producto 1",
    )
    product_id_3 = SelectField("Producto 3", coerce=int, choices=pr_choices)
    quantity_3 = IntegerField(
        "Cantidad 3",
        [NumberRange(min=0, max=1e9)],
        description="Unidades de producto 1",
    )
    product_id_4 = SelectField("Producto 4", coerce=int, choices=pr_choices)
    quantity_4 = IntegerField(
        "Cantidad 4",
        [NumberRange(min=0, max=1e9)],
        description="Unidades de producto 1",
    )
    product_id_5 = SelectField("Producto 5", coerce=int, choices=pr_choices)
    quantity_5 = IntegerField(
        "Cantidad 5",
        [NumberRange(min=0, max=1e9)],
        description="Unidades de producto 1",
    )
    submit = SubmitField("Submit")
