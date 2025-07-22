/*
=============================================================
🧱 DataWarehouse Setup Script – Drop & Recreate
=============================================================

📌 Purpose:
This script creates a fresh new database named **'DataWarehouse'** in SQL Server.  
If a database with the same name already exists, it will be completely **deleted** and recreated from scratch.

⚠️ WARNING:
Running this script will **permanently delete** the existing 'DataWarehouse' database along with all its data.  
Use this only if you're sure and have backed up any important information.

🛠️ What this script does:
1. Connects to the 'master' database.
2. Checks if 'DataWarehouse' exists:
   - If it does, sets it to SINGLE_USER mode (to kick out active users) and drops it.
3. Creates a brand new 'DataWarehouse' database.
4. Adds three schemas inside it:
   - **bronze** → for raw data
   - **silver** → for cleaned and transformed data
   - **gold** → for analytics-ready data

=============================================================
*/

USE master;
GO

-- 🔁 Drop 'DataWarehouse' if it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT '⚠️ Dropping existing database: DataWarehouse...';
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
    PRINT '✅ Old DataWarehouse dropped.';
END;
GO

-- 🆕 Create new 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- 🏗️ Create three core schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
