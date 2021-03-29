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



dbobj = dbmanager()


def get_customers():
    return dbobj.get_json("select customer_id, name from public.customer")


def get_products():
    return dbobj.get_json("select product_id, name from public.product")


def get_customer_products():
    return dbobj.get_json("select product_id, customer_id from public.customer_product")


def get_customer_orders(customer_id: int, bdate: str, edate: str):
    return dbobj.get_json(
        f"select * from public.customer_orders({customer_id}, '{bdate}', '{edate}')"
    )


def query_insert_single(tablename: str, colnames: list, values: list):
    colnames = ", ".join(colnames)
    values = ", ".join(
        [f"'{value}'" if isinstance(value, str) else f"{value}" for value in values]
    )
    return f"""
    INSERT INTO {tablename} ({colnames})
    VALUES ({values})
    """
