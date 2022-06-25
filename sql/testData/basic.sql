USE [wms]
GO

INSERT INTO t_wh DEFAULT VALUES
GO

INSERT INTO t_device (wh_id)
VALUES (1)
GO

INSERT INTO t_location (wh_id, code, [type])
VALUES
(1, 'F1', 'F'),
(1, 'A', 'P'),
(1, 'B', 'P'),
(1, 'C', 'P'),
(1, 'E', 'S'),
(1, 'F', 'S'),
(1, 'G', 'S'),
(1, 'MISSING', 'M')
GO

INSERT INTO t_item_master ( wh_id, [name], [ppu])
VALUES
(1, 'shoes', 60),
(1, 'pants', 40),
(1, 'shirt', 30)
GO

INSERT INTO t_stored_item (wh_id, item_id, location_id, qty)
VALUES
(1, 1, 2, 100),
(1, 2, 3, 100),
(1, 3, 4, 100)
GO

INSERT INTO t_user (wh_id, code)
VALUES (1, 'brad')
GO

INSERT INTO t_order_master (wh_id, customer)
VALUES
(1, 'elon musk'),
(1, 'kanye west'),
(1, 'john olin')
GO

INSERT INTO t_order_detail (wh_id, order_id, item_id, qty)
VALUES
(1, 1, 2, 10),
(1, 2, 3, 50),
(1, 3, 1, 1)
GO