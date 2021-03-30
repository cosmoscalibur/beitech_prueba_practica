import json
from pathlib import Path
import psycopg2
import beitech_app


class dbmanager:
    def __init__(self):
        with open(
            Path(beitech_app.__file__).parent.joinpath("settings.json"), "r"
        ) as json_file:
            settings = json.load(json_file)["database"]
        self.connection = psycopg2.connect(**settings)
        self.cursor = self.connection.cursor()

    def get_json(self, query: str):
        try:
            self.cursor.execute(
                f"""
            select array_to_json(array_agg(res))
            from ({query}) res;
            """
            )
            res = self.cursor.fetchall()[0][0]
            return res if isinstance(res, list) else res
        except psycopg2.Error as e:
            print(e)

    def insert(self, query: str):
        try:
            self.cursor.execute(query)
            res = self.cursor.fetchall()[0][0]
            return res
        except psycopg2.Error as e:
            print(e)
    
    def call(self, proc_with_params:str):
        try:
            self.cursor.execute(f"call {proc_with_params};")
            res = self.cursor.fetchall()
            return res
        except psycopg2.Error as e:
            print(e)


dbobj = dbmanager()


def get_customers():
    return dbobj.get_json("select customer_id, name from public.customer")


def get_products():
    return dbobj.get_json("select product_id, name from public.product")


def get_customer_products(customer_id):
    return dbobj.get_json(
        f"""
    select cp.product_id, pr.name
    from public.customer_product cp
    left join public.product pr
    on cp.product_id = pr.product_id
    where cp.customer_id = {customer_id}
    """
    )


def get_customer_orders(customer_id: int, bdate: str, edate: str):
    return dbobj.get_json(
        f"select * from public.customer_orders({customer_id}, '{bdate}', '{edate}')"
    )


def query_insert_single(tablename: str, colnames: list, values: list, returning: str):
    colnames = ", ".join(colnames)
    values = ", ".join(
        [f"'{value}'" if isinstance(value, str) else f"{value}" for value in values]
    )
    return f"""
    INSERT INTO {tablename} ({colnames})
    VALUES ({values})
    RETURNING {returning};\n
    """


def query_create_order(order_detail: list):
    order_id = dbobj.insert(
        query_insert_single(
            "public.order",
            ["customer_id", "delivery_address", "creation_date"],
            [order_detail[0], order_detail[1], order_detail[2]],
            "order_id"
        )
    )
    for product_quantity in order_detail[3]:
        order_detail_id = dbobj.insert(
            query_insert_single(
                "public.order_detail",
                ["order_id", "product_id", "quantity"],
                [order_id, product_quantity[0], product_quantity[1]],
                "order_detail_id"
            )
        )
    dbobj.call(f"public.update_order_detail({order_id})")
    dbobj.connection.commit()
    return order_id
