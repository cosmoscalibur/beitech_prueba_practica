-- DROP FUNCTION IF EXISTS customer_orders;
CREATE OR REPLACE FUNCTION public.customer_orders(cm_id integer, bdate date, edate date)
RETURNS TABLE(creation_date date, order_id integer, total numeric, delivery_address varchar, products varchar)
LANGUAGE sql
AS $$
    select creation_date, po.order_id, total, delivery_address, od.products
    from public.order po
    left join 
    (select order_id, string_agg(quantity::text || ' x ' || pr.name, ',') as products
    from public.order_detail pod
    left join public.product pr
    on pod.product_id = pr.product_id
    group by order_id) od
    on od.order_id = po.order_id
    where creation_date >= bdate and creation_date <= edate
    and customer_id = cm_id;
$$;