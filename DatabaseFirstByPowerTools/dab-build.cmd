@echo off
@echo This cmd file creates a Data API Builder configuration based on the chosen database objects.
@echo To run the cmd, create an .env file with the following contents:
@echo dab-connection-string=your connection string
@echo ** Make sure to exclude the .env file from source control **
@echo **
dotnet tool install -g Microsoft.DataApiBuilder
dab init -c dab-config.json --database-type mssql --connection-string "@env('dab-connection-string')" --host-mode Development
@echo Adding tables
dab add "Category" --source "[dbo].[Categories]" --fields.include "CategoryID,CategoryName,Description,Picture" --permissions "anonymous:*" 
dab add "Employee" --source "[dbo].[Employees]" --fields.include "EmployeeID,LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Photo,Notes,ReportsTo,PhotoPath" --permissions "anonymous:*" 
dab add "Order" --source "[dbo].[Orders]" --fields.include "OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry" --permissions "anonymous:*" 
dab add "Product" --source "[dbo].[Products]" --fields.include "ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued" --permissions "anonymous:*" 
dab add "Supplier" --source "[dbo].[Suppliers]" --fields.include "SupplierID,CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax,HomePage" --permissions "anonymous:*" 
@echo Adding views and tables without primary key
@echo No primary key found for table/view 'Category Sales for 1997', using first column (CategoryName) as key field
dab add "CategorySalesfor1997" --source "[dbo].[Category Sales for 1997]" --fields.include "CategoryName,CategorySales" --source.type "view" --source.key-fields "CategoryName" --permissions "anonymous:*" 
@echo Adding relationships
dab update Employee --relationship Employee --target.entity Employee --cardinality one
dab update Employee --relationship Employee --target.entity Employee --cardinality many
dab update Order --relationship Employee --target.entity Employee --cardinality one
dab update Employee --relationship Order --target.entity Order --cardinality many
dab update Product --relationship Category --target.entity Category --cardinality one
dab update Category --relationship Product --target.entity Product --cardinality many
dab update Product --relationship Supplier --target.entity Supplier --cardinality one
dab update Supplier --relationship Product --target.entity Product --cardinality many
@echo Adding stored procedures
dab add "CustOrderHist" --source "[dbo].[CustOrderHist]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "CustOrdersDetail" --source "[dbo].[CustOrdersDetail]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "CustOrdersOrder" --source "[dbo].[CustOrdersOrders]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "DeleteCategoryByCategoryId" --source "[dbo].[DeleteCategoryByCategoryID]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "DeleteEmployeeById" --source "[dbo].[DeleteEmployeeByID]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "DeleteProductById" --source "[dbo].[DeleteProductByID]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "DiscontinuedProduct" --source "[dbo].[DiscontinuedProducts]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "EmployeeSalesbyCountry" --source "[dbo].[Employee Sales by Country]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "NewProductDeleteCommand" --source "[dbo].[NewProductDeleteCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "NewProductInsertCommand" --source "[dbo].[NewProductInsertCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "NewProductSelectCommand" --source "[dbo].[NewProductSelectCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "NewProductUpdateCommand" --source "[dbo].[NewProductUpdateCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "PrdsDeleteCommand" --source "[dbo].[PrdsDeleteCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "PrdsInsertCommand" --source "[dbo].[PrdsInsertCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "PrdsSelectCommand" --source "[dbo].[PrdsSelectCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "PrdsUpdateCommand" --source "[dbo].[PrdsUpdateCommand]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "SalesbyYear" --source "[dbo].[Sales by Year]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "SalesByCategory" --source "[dbo].[SalesByCategory]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "SelectAllCategory" --source "[dbo].[SelectAllCategories]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "SelectAllemployee" --source "[dbo].[SelectALLEmployees]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "SelectAllProduct" --source "[dbo].[SelectAllProducts]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "TenMostExpensiveProduct" --source "[dbo].[Ten Most Expensive Products]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "TestPrd" --source "[dbo].[TestPrd]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
dab add "UpdateProductNameByProductId" --source "[dbo].[UpdateProductNameByProductID]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
@echo **
@echo ** run 'dab validate' to validate your configuration **
@echo ** run 'dab start' to start the development API host **
