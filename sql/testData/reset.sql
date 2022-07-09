USE [wms]
GO

DELETE t_pick_detail;
DELETE t_pick_master;
DELETE t_order_detail;
DELETE t_order_master;
DELETE t_user;
DELETE t_stored_item;
DELETE t_item_master;
DELETE t_location;
DELETE t_device;
DELETE t_wh;
GO

DBCC CHECKIDENT (N't_wh', RESEED, 0);
INSERT INTO t_wh DEFAULT VALUES
GO

DBCC CHECKIDENT (N't_device', RESEED, 0);
INSERT INTO t_device (wh_id)
VALUES (1)
GO

DBCC CHECKIDENT (N't_location', RESEED, 0);
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

DBCC CHECKIDENT (N't_item_master', RESEED, 0);
INSERT INTO t_item_master ( wh_id, [name], [ppu])
VALUES
(1, 'shoes', 60),
(1, 'pants', 40),
(1, 'shirt', 30)
GO

DBCC CHECKIDENT (N't_stored_item', RESEED, 0);
INSERT INTO t_stored_item (wh_id, location_id, item_id, qty)
VALUES
(1, 1, 1, 50),
(1, 1, 2, 50),
(1, 1, 3, 50),
(1, 2, 1, 50),
(1, 2, 2, 50),
(1, 2, 3, 50),
(1, 3, 1, 50),
(1, 3, 2, 50),
(1, 3, 3, 50)
GO

DBCC CHECKIDENT (N't_user', RESEED, 0);
INSERT INTO t_user (wh_id, code)
VALUES (1, 'brad')
GO

DBCC CHECKIDENT (N't_order_master', RESEED, 0);
INSERT INTO t_order_master (wh_id, order_number, customer)
VALUES
(1, 'A100', 'elon musk'),
(1, 'A200', 'kanye west'),
(1, 'A300', 'john olin')
GO

DBCC CHECKIDENT (N't_order_detail', RESEED, 0);
INSERT INTO t_order_detail (wh_id, order_master_id, item_id, qty)
VALUES
(1, 1, 2, 10),
(1, 3, 1, 1),
(1, 2, 3, 100),
(1, 2, 3, 100),
(1, 2, 3, 100)
GO
