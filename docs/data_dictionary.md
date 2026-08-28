# Data Dictionary

## customers
- `customer_id`: unique customer key
- `region`: customer macro-region
- `city`: customer city
- `customer_segment`: New / Regular / Loyal / Premium
- `signup_date`: customer registration date

## products
- `product_id`: unique product key
- `category`: product category
- `subcategory`: product subcategory
- `product_name`: synthetic SKU name
- `list_price`: catalog price
- `unit_cost`: synthetic cost estimate

## orders
- `order_id`: unique order key
- `customer_id`: foreign key to customers
- `order_datetime`: order timestamp
- `payment_method`: UPI / Card / COD / Net Banking / Wallet
- `channel`: Web / Android / iOS
- `order_status`: Delivered / Cancelled
- `order_value`: order merchandise value
- `shipping_fee`: shipping amount
- `cancellation_reason`: populated only when cancelled

## order_items
- `order_item_id`: unique order-line key
- `order_id`: foreign key to orders
- `product_id`: foreign key to products
- `quantity`: units ordered
- `unit_selling_price`: post-discount unit price
- `discount_pct`: decimal discount

## shipments
- `shipment_id`: unique shipment key
- `order_id`: foreign key to orders
- `warehouse_id`: fulfillment warehouse
- `courier_partner`: logistics partner
- `shipped_datetime`: shipment handoff time
- `delivered_datetime`: delivery timestamp
- `promised_days`: promised delivery days
- `actual_delivery_days`: elapsed order-to-delivery days
- `is_late`: 1 if actual > promised

## returns
- `return_id`: unique return key
- `order_id`: returned order
- `return_datetime`: return creation time
- `return_reason`: standardized reason
- `refund_amount`: synthetic refund amount
- `return_status`: current status
