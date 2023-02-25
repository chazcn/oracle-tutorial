--------------------------------------------------------------------------------------
-- Name	       : OT (Oracle Tutorial) Sample Database
-- Link	       : http://www.oracletutorial.com/oracle-sample-database/
-- Version     : 1.0
-- Last Updated: July-28-2017
-- Copyright   : Copyright © 2017 by www.oracletutorial.com. All Rights Reserved.
-- Notice      : Use this sample database for the educational purpose only.
--               Credit the site oracletutorial.com explitly in your materials that
--               use this sample database.
--------------------------------------------------------------------------------------
-- disable FK constraints 
ALTER TABLE countries DISABLE CONSTRAINT fk_countries_regions;
ALTER TABLE locations DISABLE CONSTRAINT fk_locations_countries;
ALTER TABLE warehouses DISABLE CONSTRAINT fk_warehouses_locations;
ALTER TABLE employees DISABLE CONSTRAINT fk_employees_manager;
ALTER TABLE products DISABLE CONSTRAINT fk_products_categories;
ALTER TABLE contacts DISABLE CONSTRAINT fk_contacts_customers;
ALTER TABLE orders DISABLE CONSTRAINT fk_orders_customers;
ALTER TABLE orders DISABLE CONSTRAINT fk_orders_employees;
ALTER TABLE order_items DISABLE CONSTRAINT fk_order_items_products;
ALTER TABLE order_items DISABLE CONSTRAINT fk_order_items_orders;
ALTER TABLE inventories DISABLE CONSTRAINT fk_inventories_products;
ALTER TABLE inventories DISABLE CONSTRAINT fk_inventories_warehouses;
--------------------------------------------------------
-- clear data
--------------------------------------------------------
DELETE FROM OT.REGIONS;
DELETE FROM OT.COUNTRIES;
DELETE FROM OT.LOCATIONS;
DELETE FROM OT.WAREHOUSES;
DELETE FROM OT.EMPLOYEES;
DELETE FROM OT.PRODUCT_CATEGORIES;
DELETE FROM OT.PRODUCTS;
DELETE FROM OT.CUSTOMERS;
DELETE FROM OT.CONTACTS;
DELETE FROM OT.ORDERS;
DELETE FROM OT.ORDER_ITEMS;
DELETE FROM OT.INVENTORIES;

-- enable FK constraints
ALTER TABLE countries ENABLE CONSTRAINT fk_countries_regions;
ALTER TABLE locations ENABLE CONSTRAINT fk_locations_countries;
ALTER TABLE warehouses ENABLE CONSTRAINT fk_warehouses_locations;
ALTER TABLE employees ENABLE CONSTRAINT fk_employees_manager;
ALTER TABLE products ENABLE CONSTRAINT fk_products_categories;
ALTER TABLE contacts ENABLE CONSTRAINT fk_contacts_customers;
ALTER TABLE orders ENABLE CONSTRAINT fk_orders_customers;
ALTER TABLE orders ENABLE CONSTRAINT fk_orders_employees;
ALTER TABLE order_items ENABLE CONSTRAINT fk_order_items_products;
ALTER TABLE order_items ENABLE CONSTRAINT fk_order_items_orders;
ALTER TABLE inventories ENABLE CONSTRAINT fk_inventories_products;
ALTER TABLE inventories ENABLE CONSTRAINT fk_inventories_warehouses;
