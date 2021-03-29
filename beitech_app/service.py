from pathlib import Path
import json
from flask import Flask, request, jsonify
from flasgger import Swagger

try:
    import beitech_app.database as dbman
except ModuleNotFoundError:
    from pathlib import Path
    import sys
    sys.path.append(str(Path(__file__).absolute().parent.parent))
    import beitech_app.database as dbman

app = Flask(__name__)
swagger = Swagger(app)


@app.route("/")
def hello_world():
    return "BeiTech App"


@app.route("/customers")
def customers():
    return jsonify(dbman.get_customers())


@app.route("/products")
def products():
    return jsonify(dbman.get_products())


@app.route("/customer_products")
def customer_products():
    return jsonify(dbman.get_customer_products())


@app.route("/customer_orders", methods=["GET"])
def customer_orders():
    if request.method == "POST":
        customer_id = int(request.form["customer_id"])
        bdate = request.form["bdate"]
        edate = request.form["edate"]
        return jsonify(dbman.get_customer_orders(customer_id, bdate, edate))
    else:
        customer_id = int(request.args.get("customer_id"))
        bdate = request.args.get("bdate")
        edate = request.args.get("edate")
        return jsonify(dbman.get_customer_orders(customer_id, bdate, edate))


if __name__ == "__main__":
    import beitech_app

    with open(
        Path(beitech_app.__file__).parent.joinpath("settings.json"), "r"
    ) as json_file:
        settings = json.load(json_file)["service"]
    app.run(host=settings["host"], port=settings["port"], debug=True)
