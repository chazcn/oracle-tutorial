CONN SYS@ORCLPDB AS SYSDBA;
GRANT CREATE ANY DIRECTORY, DROP ANY DIRECTORY TO OT;
CONN OT/PUMA@ORCLPDB;

CREATE OR REPLACE DIRECTORY ot_data_dir
    AS 'your_directory\ext_files\data';
CREATE OR REPLACE DIRECTORY ot_log_dir
    AS 'your_directory\ext_files\log';
CREATE OR REPLACE DIRECTORY ot_bad_dir
    AS 'your_directory\ext_files\bad';

-- SELECT * FROM All_Directories;

-- DROP TABLE ext_regions;
-- DROP TABLE ext_countries;
-- DROP TABLE ext_locations;
-- DROP TABLE ext_warehouses;
-- DROP TABLE ext_employees;
-- DROP TABLE ext_product_categories;
-- DROP TABLE ext_products;
-- DROP TABLE ext_customers;
-- DROP TABLE ext_contacts;
-- DROP TABLE ext_order_items;
-- DROP TABLE ext_orders;
-- DROP TABLE ext_inventories;

CREATE TABLE ext_regions
  (
    region_id   NUMBER,
    region_name VARCHAR2( 50 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'regions%a_%p.bad'
      LOGFILE ot_log_dir: 'regions%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (region_id, region_name)
    )
    LOCATION ('regions.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_countries
  (
    country_id   CHAR( 2 )     ,
    country_name VARCHAR2( 40 ),
    region_id    NUMBER   
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'countries%a_%p.bad'
      LOGFILE ot_log_dir: 'countries%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (country_id, country_name, region_id)
    )
    LOCATION ('countries.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_locations
  (
    location_id NUMBER         ,
    address     VARCHAR2( 255 ),
    postal_code VARCHAR2( 20 ) ,
    city        VARCHAR2( 50 ) ,
    state       VARCHAR2( 50 ) ,
    country_id  CHAR( 2 ) 
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'locations%a_%p.bad'
      LOGFILE ot_log_dir: 'locations%a_%p.log'
      FIELDS TERMINATED BY '","'
      MISSING FIELD VALUES ARE NULL
      (location_id, address, postal_code, city, state, country_id)
    )
    LOCATION ('locations.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_warehouses
  (
    warehouse_id   NUMBER         ,
    warehouse_name VARCHAR( 255 ) ,
    location_id    NUMBER( 12, 0 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'warehouses%a_%p.bad'
      LOGFILE ot_log_dir: 'warehouses%a_%p.log'
      FIELDS TERMINATED BY '","'
      MISSING FIELD VALUES ARE NULL
      (warehouse_id, warehouse_name, location_id)
    )
    LOCATION ('warehouses.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_employees
  (
    employee_id NUMBER         ,
    first_name  VARCHAR( 255 ) ,
    last_name   VARCHAR( 255 ) ,
    email       VARCHAR( 255 ) ,
    phone       VARCHAR( 50 )  ,
    hire_date   VARCHAR( 10 )  ,
    manager_id  NUMBER,
    job_title   VARCHAR( 255 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'employees%a_%p.bad'
      LOGFILE ot_log_dir: 'employees%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (employee_id, first_name, last_name, email, phone, hire_date, manager_id, job_title)
    )
    LOCATION ('employees.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_product_categories
  (
    category_id   NUMBER         ,
    category_name VARCHAR2( 255 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'product_categories%a_%p.bad'
      LOGFILE ot_log_dir: 'product_categories%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (category_id, category_name)
    )
    LOCATION ('product_categories.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_products
  (
    product_id    NUMBER          ,
    product_name  VARCHAR2( 255 ) ,
    description   VARCHAR2( 2000 ),
    standard_cost NUMBER( 9, 2 )  ,
    list_price    NUMBER( 9, 2 )  ,
    category_id   NUMBER
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'products%a_%p.bad'
      LOGFILE ot_log_dir: 'products%a_%p.log'
      FIELDS TERMINATED BY '","'
      MISSING FIELD VALUES ARE NULL
      (product_id, product_name, DESCRIPTION, standard_cost, list_price, category_id)
    )
    LOCATION ('products.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_customers
  (
    customer_id  NUMBER ,
    name         VARCHAR2( 255 ),
    address      VARCHAR2( 255 ),
    website      VARCHAR2( 255 ),
    credit_limit NUMBER( 8, 2 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'customers%a_%p.bad'
      LOGFILE ot_log_dir: 'customers%a_%p.log'
      FIELDS TERMINATED BY '","'
      MISSING FIELD VALUES ARE NULL
      (customer_id, name, address, website, credit_limit)
    )
    LOCATION ('customers.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_contacts
  (
    contact_id  NUMBER         ,
    first_name  VARCHAR2( 255 ),
    last_name   VARCHAR2( 255 ),
    email       VARCHAR2( 255 ),
    phone       VARCHAR2( 20 )          ,
    customer_id NUMBER
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'contacts%a_%p.bad'
      LOGFILE ot_log_dir: 'contacts%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (contact_id, first_name, last_name, email, phone, customer_id)
    )
    LOCATION ('contacts.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_orders
  (
    order_id    NUMBER,
    customer_id NUMBER( 6, 0 ),
    status      VARCHAR( 20 ) ,
    salesman_id NUMBER( 6, 0 ),
    order_date  VARCHAR( 10 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'orders%a_%p.bad'
      LOGFILE ot_log_dir: 'orders%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (order_id, customer_id, status, salesman_id, order_date)
    )
    LOCATION ('orders.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_order_items
  (
    order_id   NUMBER( 12, 0 ),
    item_id    NUMBER( 12, 0 ),
    product_id NUMBER( 12, 0 ),
    quantity   NUMBER( 8, 0 ) ,
    unit_price NUMBER( 8, 2 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'order_items%a_%p.bad'
      LOGFILE ot_log_dir: 'order_items%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (order_id, item_id, product_id, quantity, unit_price)
    )
    LOCATION ('order_items.csv')
  )
  REJECT LIMIT UNLIMITED;

CREATE TABLE ext_inventories
  (
    product_id   NUMBER( 12, 0 ),
    warehouse_id NUMBER( 12, 0 ),
    quantity     NUMBER( 8, 0 )
  )
  ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ot_data_dir
    ACCESS PARAMETERS
    (
      RECORDS DELIMITED BY NEWLINE
      CHARACTERSET UTF8
      BADFILE ot_bad_dir: 'inventories%a_%p.bad'
      LOGFILE ot_log_dir: 'inventories%a_%p.log'
      FIELDS TERMINATED BY ','
      MISSING FIELD VALUES ARE NULL
      (product_id, warehouse_id, quantity)
    )
    LOCATION ('inventories.csv')
  )
  REJECT LIMIT UNLIMITED;