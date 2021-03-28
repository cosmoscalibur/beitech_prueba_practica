DROP PROCEDURE IF EXISTS update_order_detail;
CREATE PROCEDURE public.update_order_detail(od_id integer)
LANGUAGE SQL
AS $$
	UPDATE
		public.order_detail
	SET (product_description, price) =
		(select product_description, price
		 from public.product
		 where order_detail.product_id = product.product_id)
	where order_detail.order_id = od_id;
	update public.order
	set total = (select sum(price *  quantity)
				 from public.order_detail
				 where order_detail.order_id = od_id)
	where order_id = od_id;
$$;
