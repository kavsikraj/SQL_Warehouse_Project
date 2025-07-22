/*
=============================================================
🧾 Bronze Layer Table Setup – Raw Data Stage
=============================================================

📌 Purpose:
This script sets up the **Bronze Layer** in the Data Warehouse by creating raw staging tables in the `bronze` schema.  
These tables hold unprocessed data from both **CRM** and **ERP** systems, just as they were received from the source files.

🧱 Tables created in this script:
1. bronze.crm_cust_info         – Customer details from CRM
2. bronze.crm_prd_info          – Product info from CRM
3. bronze.crm_sales_details     – Sales transactions from CRM
4. bronze.erp_cust_az12         – Customer demographics from ERP
5. bronze.erp_loc_a101          – Customer location from ERP
6. bronze.erp_px_cat_g1v2       – Product category info from ERP

⚠️ WARNING:
- Each table is dropped **if it already exists**, and then recreated.
- This means **all existing data will be lost** when this script is run.
- Use this only during initial setup or when resetting the bronze layer intentionally.

✅ Tip:
These are raw ingestion tables—no transformations happen here. Just land the data as-is from CSVs or other sources.

=============================================================
*/



IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
DROP TABLE bronze.crm_cust_info
CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_material_status VARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
DROP TABLE bronze.crm_prd_info
CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(60),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12
CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen VARCHAR(50)
);
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2
CREATE TABLE bronze.erp_px_cat_g1v2(
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);

