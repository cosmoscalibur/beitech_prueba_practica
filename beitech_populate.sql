-- Datos de prueba de Producto
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto A', 'Descripción A', 208917.47);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto B', 'Descripción B', 411400.63);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto C', 'Descripción C', 599931.47);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto D', 'Descripción D', 1590570.13);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto E', 'Descripción E', 91761.95);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto F', 'Descripción F', 551144.01);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto G', 'Descripción G', 4013289.26);
INSERT INTO public.product (name, product_description, price)
VALUES ('Producto H', 'Descripción H', 513685.19);
-- Datos de prueba de Clientes
INSERT INTO public.customer (name, email)
VALUES ('Nombre 1', 'nombre_1@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 2', 'nombre_2@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 3', 'nombre_3@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 4', 'nombre_4@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 5', 'nombre_5@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 6', 'nombre_6@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 7', 'nombre_7@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 8', 'nombre_8@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 9', 'nombre_9@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 10', 'nombre_10@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 11', 'nombre_11@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 12', 'nombre_12@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 13', 'nombre_13@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 14', 'nombre_14@xyz.com');
INSERT INTO public.customer (name, email)
VALUES ('Nombre 15', 'nombre_15@xyz.com');
-- Datos de prueba de relación Producto Cliente
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (1, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (1, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (1, 3);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (1, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (1, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (1, 7);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (2, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (2, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (2, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (3, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (3, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (3, 3);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (3, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (3, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (3, 7);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (4, 3);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (4, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (4, 7);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (4, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (5, 3);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (5, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (6, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (6, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (6, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (6, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (7, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (7, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (7, 7);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (7, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (7, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (8, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (8, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (8, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (9, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (9, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (9, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (9, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (9, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (10, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (10, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (10, 7);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (10, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (11, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (11, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (12, 3);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (12, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (12, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (12, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (12, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 3);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (13, 8);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (14, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (14, 4);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (14, 6);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (14, 7);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (14, 1);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (15, 2);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (15, 5);
INSERT INTO public.customer_product (customer_id, product_id)
VALUES (15, 8);