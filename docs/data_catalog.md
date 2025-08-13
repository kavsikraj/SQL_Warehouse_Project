Data Dictionary For Gold Layer

Data Catalog – gold.fact_sales

Overview:
Contains detailed sales transactions enriched with product and customer dimension keys.
Serves as the central fact table for sales reporting in the gold layer.
| Field Name     | Data Type\*  | Description                                                                            |
| -------------- | ------------ | -------------------------------------------------------------------------------------- |
| `order_number` | STRING / INT | Unique identifier for the sales order.                                                 |
| `product_key`  | INT          | Surrogate key for the product dimension.                                               |
| `customer_key` | INT          | Surrogate key for the customer dimension.                                              |
| `order_date`   | DATE         | Date when the order was placed.                                                        |
| `ship_date`    | DATE         | Date when the order was shipped.                                                       |
| `due_date`     | DATE         | Date by which the order was due.                                                       |
| `sales_amount` | DECIMAL      | Total sales value for the order.                                                       |
| `quantiy`      | INT          | Number of units sold. *(Note: spelling in SQL is `quantiy` — likely meant `quantity`)* |
| `price`        | DECIMAL      | Unit price of the product sold.                                                        |

Data Catalog – gold.dim_products

Overview:
Holds master data for products, including category, cost, and lifecycle information.
Acts as a dimension table linked to sales data via product_key.
| Field Name       | Data Type\*      | Description                                                                   |
| ---------------- | ---------------- | ----------------------------------------------------------------------------- |
| `product_key`    | INT              | Surrogate key for the product dimension. Generated using row number ordering. |
| `product_id`     | STRING / INT     | Business identifier for the product.                                          |
| `product_number` | STRING / INT     | Original product number from source system.                                   |
| `product_name`   | STRING           | Name of the product.                                                          |
| `category_id`    | STRING / INT     | ID representing the product category.                                         |
| `category`       | STRING           | High-level classification of the product.                                     |
| `subcategory`    | STRING           | More specific classification under the category.                              |
| `maintenance`    | STRING / BOOLEAN | Indicates if product is maintenance-related.                                  |
| `cost`           | DECIMAL          | Cost of producing/acquiring the product.                                      |
| `product_line`   | STRING           | Product line or brand grouping.                                               |
| `start_date`     | DATE             | Date when the product became active.                                          |

Data Catalog – gold.dim_customers

Overview:
Stores customer master data with demographic, location, and account creation details.
Used as a dimension table linked to sales data via customer_key.
| Field Name        | Data Type\*  | Description                                                                    |
| ----------------- | ------------ | ------------------------------------------------------------------------------ |
| `customer_key`    | INT          | Surrogate key for the customer dimension. Generated using row number ordering. |
| `customer_id`     | STRING / INT | Business identifier for the customer.                                          |
| `customer_number` | STRING / INT | Alternate customer number from source system.                                  |
| `first_name`      | STRING       | Customer’s first name.                                                         |
| `last_name`       | STRING       | Customer’s last name.                                                          |
| `marital_status`  | STRING       | Marital status of the customer.                                                |
| `country`         | STRING       | Country of the customer’s location.                                            |
| `gender`          | STRING       | Gender of the customer; derived from source or alternative lookup.             |
| `birthdate`       | DATE         | Date of birth of the customer.                                                 |
| `create_date`     | DATE         | Date when the customer record was created.                                     |
