SELECT *
FROM t_pick_master

SELECT *
FROM t_pick_detail

SELECT *
FROM t_order_master

SELECT *
FROM t_order_detail

SELECT *
FROM t_item_master

SELECT * 
FROM t_location

SELECT pkd.id, order_number, name AS item, qty_needed, qty_picked, status, code as pick_location
FROM t_pick_detail pkd
LEFT JOIN t_order_detail ord
	ON pkd.wh_id = ord.wh_id
	AND pkd.order_detail_id = ord.id
LEFT JOIN t_item_master itm
	ON ord.wh_id = itm.wh_id
	AND ord.item_id = itm.id
LEFT JOIN t_order_master orm
	ON ord.wh_id = orm.wh_id
	AND ord.order_master_id = orm.id
LEFT JOIN t_location loc
	ON pkd.wh_id = loc.wh_id
	AND pkd.pick_location = loc.id




