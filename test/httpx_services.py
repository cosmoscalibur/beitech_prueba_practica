import json
import httpx

try:
    import beitech_app
except ModuleNotFoundError:
    from pathlib import Path
    import sys

    sys.path.append(str(Path(__file__).absolute().parent.parent))
    import beitech_app

with open(
    Path(beitech_app.__file__).parent.joinpath("settings.json"), "r"
) as json_file:
    settings = json.load(json_file)["service"]
host = settings['host']
port = settings['port']

# Cliente 1
# Productos dispobibles: 1, 2, 3, 4, 6, 7
# Caso con más de una orden en el último mes
orden1 = {"customer_id": 1, "creation_date": "2020-12-15", "delivery_address": "Buenos aires",
            "product_id_1": 2, "quantity_1": 4, "product_id_2": 7, "quantity_2": 1}
r = httpx.get(f'http://{host}:{port}/create_order', params=orden1)
print(r.url)

orden2 = {"customer_id": 1, "creation_date": "2021-03-15", "delivery_address": "Buenos aires",
            "product_id_1": 1, "quantity_1": 2, "product_id_2": 2, "quantity_2": 1,
            "product_id_3": 6, "quantity_3": 3}
httpx.get(f'http://{host}:{port}/create_order', params=orden2)

orden3 = {"customer_id": 1, "creation_date": "2021-03-30", "delivery_address": "Buenos aires",
            "product_id_1": 1, "quantity_1": 2, "product_id_2": 4, "quantity_2": 1,
            "product_id_3": 7, "quantity_3": 3, "product_id_4": 7, "quantity_4": 3}
httpx.get(f'http://{host}:{port}/create_order', params=orden3)

# Cliente 8
# Productos dispobibles: 4, 6, 8
# caso sin orden en el último mes
orden4 = {"customer_id": 8, "creation_date": "2020-12-19", "delivery_address": "Manrique",
            "product_id_1": 4, "quantity_1": 2}
httpx.get(f'http://{host}:{port}/create_order', params=orden4)

# Cliente 12
# Productos dispobibles: 3, 4, 5, 6, 8
# Caso con una sola orden en el último mes
orden5 = {"customer_id": 12, "creation_date": "2021-03-30", "delivery_address": "Poblado",
            "product_id_1": 3, "quantity_1": 2, "product_id_2": 4, "quantity_2": 1,
            "product_id_3": 5, "quantity_3": 3, "product_id_4": 8, "quantity_4": 3}
httpx.get(f'http://{host}:{port}/create_order', params=orden5)
