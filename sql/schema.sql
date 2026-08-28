-- E-commerce Order-to-Delivery BA Portfolio Project
-- Database: SQLite

CREATE TABLE customers (
  customer_id TEXT PRIMARY KEY,
  region TEXT NOT NULL,
  city TEXT NOT NULL,
  customer_segment TEXT NOT NULL,
  signup_date DATE NOT NULL
);

CREATE TABLE products (
  product_id TEXT PRIMARY KEY,
  category TEXT NOT NULL,
  subcategory TEXT NOT NULL,
  product_name TEXT NOT NULL,
  list_price REAL NOT NULL,
  unit_cost REAL NOT NULL
);

CREATE TABLE warehouses (
  warehouse_id TEXT PRIMARY KEY,
  warehouse_city TEXT NOT NULL,
  region TEXT NOT NULL,
  lat REAL,
  lon REAL
);

CREATE TABLE orders (
  order_id TEXT PRIMARY KEY,
  customer_id TEXT NOT NULL,
  order_datetime DATETIME NOT NULL,
  payment_method TEXT NOT NULL,
  channel TEXT NOT NULL,
  order_status TEXT NOT NULL,
  order_value REAL NOT NULL,
  shipping_fee REAL NOT NULL,
  cancellation_reason TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id TEXT PRIMARY KEY,
  order_id TEXT NOT NULL,
  product_id TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  unit_selling_price REAL NOT NULL,
  discount_pct REAL NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE shipments (
  shipment_id TEXT PRIMARY KEY,
  order_id TEXT NOT NULL,
  warehouse_id TEXT NOT NULL,
  courier_partner TEXT NOT NULL,
  shipped_datetime DATETIME NOT NULL,
  delivered_datetime DATETIME NOT NULL,
  promised_days REAL NOT NULL,
  actual_delivery_days REAL NOT NULL,
  is_late INTEGER NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE returns (
  return_id TEXT PRIMARY KEY,
  order_id TEXT NOT NULL,
  return_datetime DATETIME NOT NULL,
  return_reason TEXT NOT NULL,
  refund_amount REAL NOT NULL,
  return_status TEXT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
