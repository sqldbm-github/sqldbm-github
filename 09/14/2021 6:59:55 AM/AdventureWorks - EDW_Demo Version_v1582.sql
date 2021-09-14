-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT "fileFormat_431"
 TYPE = JSON;


-- ************************************** "EDW"."DimScenario"
CREATE TABLE "EDW"."DimScenario"
(
 "ScenarioKey"  number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Scenario Identifier',
 "ScenarioName" varchar(50) COMMENT 'Name of the Scenario',
 "CreatedBy"    varchar(50) NOT NULL COMMENT 'Who Created this Scenario',
 "CreatedDate"  timestamp_ntz(9) NOT NULL COMMENT 'Scenario Creation Date',
 "UpdatedDate"  timestamp_ntz(9) NOT NULL,
 "UpdatedBy"    varchar(50) NOT NULL,
 "TestCol"      varchar(50) NOT NULL,
 CONSTRAINT "PK_DimScenario" PRIMARY KEY ( "ScenarioKey" )
)
COMMENT = 'Dimension Scenario';


-- ************************************** "EDW"."DimSalesTerritory"
CREATE TABLE "EDW"."DimSalesTerritory"
(
 "SalesTerritoryKey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "SalesTerritoryAlternateKey" number(38,0),
 "SalesTerritoryRegion"       varchar(50) NOT NULL,
 "SalesTerritoryCountry"      varchar(50) NOT NULL,
 "SalesTerritoryGroup"        varchar(50),
 CONSTRAINT "PK_DimSalesTerritory" PRIMARY KEY ( "SalesTerritoryKey" )
)
COMMENT = 'Sales Territory data';


-- ************************************** "EDW"."DimPromotion"
CREATE TABLE "EDW"."DimPromotion"
(
 "PromotionKey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "PromotionAlternateKey"    number(38,0),
 "EnglishPromotionName"     varchar(255),
 "SpanishPromotionName"     varchar(255),
 "FrenchPromotionName"      varchar(255),
 "DiscountPct"              float,
 "EnglishPromotionType"     varchar(50),
 "SpanishPromotionType"     varchar(50),
 "FrenchPromotionType"      varchar(50),
 "EnglishPromotionCategory" varchar(50),
 "SpanishPromotionCategory" varchar(50),
 "FrenchPromotionCategory"  varchar(50),
 "MinQty"                   number(38,0),
 "MaxQty"                   number(38,0),
 CONSTRAINT "PK_DimPromotion" PRIMARY KEY ( "PromotionKey" )
);


-- ************************************** "EDW"."DimProductCategory"
CREATE TABLE "EDW"."DimProductCategory"
(
 "ProductCategoryKey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "ProductCategoryAlternateKey" number(38,0),
 "EnglishProductCategoryName"  varchar(50) NOT NULL,
 "SpanishProductCategoryName"  varchar(50) NOT NULL,
 "FrenchProductCategoryName"   varchar(50) NOT NULL,
 CONSTRAINT "PK_DimProductCategory" PRIMARY KEY ( "ProductCategoryKey" )
);


-- ************************************** "EDW"."DimOrganization"
CREATE TABLE "EDW"."DimOrganization"
(
 "OrganizationKey"       number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "ParentOrganizationKey" number(38,0),
 "PercentageOfOwnership" varchar(16),
 "OrganizationName"      varchar(50),
 "CurrencyKey"           number(38,0),
 CONSTRAINT "PK_DimOrganization" PRIMARY KEY ( "OrganizationKey" )
)
COMMENT = 'Dimension for Organizational Data';


-- ************************************** "EDW"."DimGeography"
CREATE TABLE "EDW"."DimGeography"
(
 "GeographyKey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "City"                     varchar(30),
 "StateProvinceCode"        varchar(3),
 "StateProvinceName"        varchar(50),
 "CountryRegionCode"        varchar(3),
 "EnglishCountryRegionName" varchar(50),
 "SpanishCountryRegionName" varchar(50),
 "FrenchCountryRegionName"  varchar(50),
 "PostalCode"               varchar(15),
 "SalesTerritoryKey"        number(38,0),
 "IpAddressLocator"         varchar(15),
 CONSTRAINT "PK_DimGeography" PRIMARY KEY ( "GeographyKey" )
);


-- ************************************** "EDW"."DimDepartmentGroup"
CREATE TABLE "EDW"."DimDepartmentGroup"
(
 "DepartmentGroupKey"       number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "ParentDepartmentGroupKey" number(38,0),
 "DepartmentGroupName"      varchar(50),
 CONSTRAINT "PK_DimDepartmentGroup" PRIMARY KEY ( "DepartmentGroupKey" )
)
COMMENT = 'Dimension for Department groups';


-- ************************************** "EDW"."DimDate"
CREATE TABLE "EDW"."DimDate"
(
 "DateKey"              number(38,0) NOT NULL,
 "FullDateAlternateKey" date NOT NULL,
 "DayNumberOfWeek"      number(38,0) NOT NULL,
 "EnglishDayNameOfWeek" varchar(10) NOT NULL,
 "SpanishDayNameOfWeek" varchar(10) NOT NULL,
 "FrenchDayNameOfWeek"  varchar(10) NOT NULL,
 "DayNumberOfMonth"     number(38,0) NOT NULL,
 "DayNumberOfYear"      number(38,0) NOT NULL,
 "WeekNumberOfYear"     number(38,0) NOT NULL,
 "EnglishMonthName"     varchar(10) NOT NULL,
 "SpanishMonthName"     varchar(10) NOT NULL,
 "FrenchMonthName"      varchar(10) NOT NULL,
 "MonthNumberOfYear"    number(38,0) NOT NULL,
 "CalendarQuarter"      number(38,0) NOT NULL,
 "CalendarYear"         number(38,0) NOT NULL,
 "CalendarSemester"     number(38,0) NOT NULL,
 "FiscalQuarter"        number(38,0) NOT NULL,
 "FiscalYear"           number(38,0) NOT NULL,
 "FiscalSemester"       number(38,0) NOT NULL,
 CONSTRAINT "PK_DimDate" PRIMARY KEY ( "DateKey" )
)
COMMENT = 'Dimension for Date time';


-- ************************************** "EDW"."DimCurrency"
CREATE TABLE "EDW"."DimCurrency"
(
 "CurrencyKey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Currency Identifier',
 "CurrencyAlternateKey" varchar(3) NOT NULL COMMENT 'Alternate Currency Identifier',
 "CurrencyName"         varchar(50) NOT NULL COMMENT 'Name of the Currency',
 CONSTRAINT "PK_DimCurrency" PRIMARY KEY ( "CurrencyKey" )
)
COMMENT = 'Dimension for Currency Data';


-- ************************************** "EDW"."DimAccount"
CREATE TABLE "EDW"."DimAccount"
(
 "AccountKey"                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 "ParentAccountKey"              number(38,0) COMMENT 'Identifier of parent Account',
 "AccountCodeAlternateKey"       number(38,0),
 "ParentAccountCodeAlternateKey" number(38,0),
 "AccountDescription"            varchar(50),
 "AccountType"                   varchar(50),
 "Operator"                      varchar(50),
 "CustomMembers"                 varchar(300),
 "ValueType"                     varchar(50),
 "CustomMemberOptions"           varchar(200),
 CONSTRAINT "PK_DimAccount" PRIMARY KEY ( "AccountKey" )
)
COMMENT = 'Holds all Account information';


-- ************************************** "EDW"."NewFactCurrencyRate"
CREATE TABLE "EDW"."NewFactCurrencyRate"
(
 "AverageRate"  float,
 "CurrencyID"   varchar(3),
 "CurrencyDate" date,
 "EndOfDayRate" float,
 "CurrencyKey"  number(38,0),
 "DateKey"      number(38,0),
 CONSTRAINT "FK_NewFactCurrencyRate_469" FOREIGN KEY ( "CurrencyKey" ) REFERENCES "EDW"."DimCurrency" ( "CurrencyKey" ),
 CONSTRAINT "FK_NewFactCurrencyRate_471" FOREIGN KEY ( "DateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" )
);


-- ************************************** "EDW"."FactSurveyResponse"
CREATE TABLE "EDW"."FactSurveyResponse"
(
 "SurveyResponseKey"             number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "DateKey"                       number(38,0) NOT NULL,
 "CustomerKey"                   number(38,0) NOT NULL,
 "ProductCategoryKey"            number(38,0) NOT NULL,
 "EnglishProductCategoryName"    varchar(50) NOT NULL,
 "ProductSubcategoryKey"         number(38,0) NOT NULL,
 "EnglishProductSubcategoryName" varchar(50) NOT NULL,
 CONSTRAINT "FK_FactSurveyResponse_465" FOREIGN KEY ( "DateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" ),
 CONSTRAINT "FK_FactSurveyResponse_467" FOREIGN KEY ( "ProductCategoryKey" ) REFERENCES "EDW"."DimProductCategory" ( "ProductCategoryKey" )
);


-- ************************************** "EDW"."FactSalesQuota"
CREATE TABLE "EDW"."FactSalesQuota"
(
 "SalesQuotaKey"    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "EmployeeKey"      number(38,0) NOT NULL,
 "DateKey"          number(38,0) NOT NULL,
 "CalendarYear"     number(38,0) NOT NULL,
 "CalendarQuarter"  number(38,0) NOT NULL,
 "SalesAmountQuota" number(38,0) NOT NULL,
 CONSTRAINT "FK_FactSalesQuota_463" FOREIGN KEY ( "DateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" )
);


-- ************************************** "EDW"."FactProductInventory"
CREATE TABLE "EDW"."FactProductInventory"
(
 "ProductKey"   number(38,0) NOT NULL,
 "DateKey"      number(38,0) NOT NULL,
 "MovementDate" date NOT NULL,
 "UnitCost"     number(38,0) NOT NULL,
 "UnitsIn"      number(38,0) NOT NULL,
 "UnitsOut"     number(38,0) NOT NULL,
 "UnitsBalance" number(38,0) NOT NULL,
 CONSTRAINT "FK_FactProductInventory_443" FOREIGN KEY ( "DateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" )
);


-- ************************************** "EDW"."FactFinance"
CREATE TABLE "EDW"."FactFinance"
(
 "FinanceKey"         number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "DateKey"            number(38,0) NOT NULL,
 "OrganizationKey"    number(38,0) NOT NULL,
 "DepartmentGroupKey" number(38,0) NOT NULL,
 "ScenarioKey"        number(38,0) NOT NULL,
 "AccountKey"         number(38,0) NOT NULL,
 "Amount"             float NOT NULL,
 CONSTRAINT "FK_FactFinance_417" FOREIGN KEY ( "DateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" ),
 CONSTRAINT "FK_FactFinance_419" FOREIGN KEY ( "OrganizationKey" ) REFERENCES "EDW"."DimOrganization" ( "OrganizationKey" ),
 CONSTRAINT "FK_FactFinance_421" FOREIGN KEY ( "DepartmentGroupKey" ) REFERENCES "EDW"."DimDepartmentGroup" ( "DepartmentGroupKey" ),
 CONSTRAINT "FK_FactFinance_423" FOREIGN KEY ( "ScenarioKey" ) REFERENCES "EDW"."DimScenario" ( "ScenarioKey" ),
 CONSTRAINT "FK_FactFinance_425" FOREIGN KEY ( "AccountKey" ) REFERENCES "EDW"."DimAccount" ( "AccountKey" )
)
COMMENT = 'Facts for Finance';


-- ************************************** "EDW"."DimReseller"
CREATE TABLE "EDW"."DimReseller"
(
 "ResellerKey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "GeographyKey"         number(38,0),
 "ResellerAlternateKey" varchar(15),
 "Phone"                varchar(25),
 "BusinessType"         varchar(20) NOT NULL,
 "ResellerName"         varchar(50) NOT NULL,
 "NumberEmployees"      number(38,0),
 "OrderFrequency"       varchar(1),
 "OrderMonth"           number(38,0),
 "FirstOrderYear"       number(38,0),
 "LastOrderYear"        number(38,0),
 "ProductLine"          varchar(50),
 "AddressLine1"         varchar(60),
 "AddressLine2"         varchar(60),
 "AnnualSales"          number(38,0),
 "BankName"             varchar(50),
 "MinPaymentType"       number(38,0),
 "MinPaymentAmount"     number(38,0),
 "AnnualRevenue"        number(38,0),
 "YearOpened"           number(38,0),
 CONSTRAINT "PK_DimReseller" PRIMARY KEY ( "ResellerKey" ),
 CONSTRAINT "FK_DimReseller_411" FOREIGN KEY ( "GeographyKey" ) REFERENCES "EDW"."DimGeography" ( "GeographyKey" )
);


-- ************************************** "EDW"."DimProductSubcategory"
CREATE TABLE "EDW"."DimProductSubcategory"
(
 "ProductSubcategoryKey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "ProductSubcategoryAlternateKey" number(38,0),
 "EnglishProductSubcategoryName"  varchar(50) NOT NULL,
 "SpanishProductSubcategoryName"  varchar(50) NOT NULL,
 "FrenchProductSubcategoryName"   varchar(50) NOT NULL,
 "ProductCategoryKey"             number(38,0),
 CONSTRAINT "PK_DimProductSubcategory" PRIMARY KEY ( "ProductSubcategoryKey" ),
 CONSTRAINT "FK_DimProductSubcategory_409" FOREIGN KEY ( "ProductCategoryKey" ) REFERENCES "EDW"."DimProductCategory" ( "ProductCategoryKey" )
);


-- ************************************** "EDW"."DimEmployee"
CREATE TABLE "EDW"."DimEmployee"
(
 "EmployeeKey"                          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "ParentEmployeeKey"                    number(38,0),
 "EmployeeNationalIDAlternateKey"       varchar(15),
 "ParentEmployeeNationalIDAlternateKey" varchar(15),
 "SalesTerritoryKey"                    number(38,0),
 "FirstName"                            varchar(50) NOT NULL,
 "LastName"                             varchar(50) NOT NULL,
 "MiddleName"                           varchar(50),
 "NameStyle"                            number(38,0) NOT NULL,
 "Title"                                varchar(50),
 "HireDate"                             date,
 "BirthDate"                            date,
 "LoginID"                              varchar(256),
 "EmailAddress"                         varchar(50),
 "Phone"                                varchar(25),
 "MaritalStatus"                        varchar(1),
 "EmergencyContactName"                 varchar(50),
 "EmergencyContactPhone"                varchar(25),
 "SalariedFlag"                         number(38,0),
 "Gender"                               varchar(1),
 "PayFrequency"                         number(38,0),
 "BaseRate"                             number(38,0),
 "VacationHours"                        number(38,0),
 "SickLeaveHours"                       number(38,0),
 "CurrentFlag"                          number(38,0) NOT NULL,
 "SalesPersonFlag"                      number(38,0) NOT NULL,
 "DepartmentName"                       varchar(50),
 "StartDate"                            date,
 "EndDate"                              date,
 "Status"                               varchar(50),
 CONSTRAINT "PK_DimEmployee" PRIMARY KEY ( "EmployeeKey" ),
 CONSTRAINT "FK_DimEmployee_403" FOREIGN KEY ( "ParentEmployeeKey" ) REFERENCES "EDW"."DimEmployee" ( "EmployeeKey" ),
 CONSTRAINT "FK_DimEmployee_405" FOREIGN KEY ( "SalesTerritoryKey" ) REFERENCES "EDW"."DimSalesTerritory" ( "SalesTerritoryKey" )
)
COMMENT = 'This table holds all Employee Information';


-- ************************************** "EDW"."DimCustomer"
CREATE TABLE "EDW"."DimCustomer"
(
 "CustomerKey"          number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Customer Identifier',
 "GeographyKey"         number(38,0) COMMENT 'Geographic informatio',
 "CustomerAlternateKey" varchar(15) NOT NULL COMMENT 'Alternate Key',
 "Title"                varchar(8) COMMENT 'Title of the Customer',
 "FirstName"            varchar(50),
 "MiddleName"           varchar(50),
 "LastName"             varchar(50),
 "NameStyle"            varchar(5),
 "BirthDate"            date,
 "MaritalStatus"        varchar(1),
 "Suffix"               varchar(10),
 "Gender"               varchar(1),
 "EmailAddress"         varchar(50),
 "YearlyIncome"         number(38,0),
 "TotalChildren"        number(38,0),
 "NumberChildrenAtHome" number(38,0),
 "EnglishEducation"     varchar(40),
 "SpanishEducation"     varchar(40),
 "FrenchEducation"      varchar(40),
 "EnglishOccupation"    varchar(100),
 "SpanishOccupation"    varchar(100),
 "FrenchOccupation"     varchar(100),
 "HouseOwnerFlag"       varchar(1),
 "NumberCarsOwned"      number(38,0),
 "AddressLine"          varchar(120),
 "AddressLine2"         varchar(120),
 "Phone"                varchar(20),
 "DateFirstPurchase"    date,
 "CommuteDistance"      varchar(15),
 CONSTRAINT "PK_DimCustomer" PRIMARY KEY ( "CustomerKey" ),
 CONSTRAINT "FK_DimCustomer_401" FOREIGN KEY ( "GeographyKey" ) REFERENCES "EDW"."DimGeography" ( "GeographyKey" )
)
COMMENT = 'Dimension for Customer Data';


-- ************************************** "EDW"."ChildDemo"
CREATE TABLE "EDW"."ChildDemo"
(
 "ChildDemoId"  NOT NULL,
 "ScenarioKey" number(38,0) NOT NULL COMMENT 'Scenario Identifier',
 "CreatedBy"   varchar(50) NOT NULL,
 "CreatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedBy"   varchar(50) NOT NULL,
 CONSTRAINT "PK_624" PRIMARY KEY ( "ChildDemoId" ),
 CONSTRAINT "FK_619" FOREIGN KEY ( "ScenarioKey" ) REFERENCES "EDW"."DimScenario" ( "ScenarioKey" )
);


-- ************************************** "EDW"."DimProduct"
CREATE TABLE "EDW"."DimProduct"
(
 "ProductKey"            number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "ProductAlternateKey"   varchar(25),
 "ProductSubcategoryKey" number(38,0),
 "WeightUnitMeasureCode" varchar(3),
 "SizeUnitMeasureCode"   varchar(3),
 "EnglishProductName"    varchar(50) NOT NULL,
 "SpanishProductName"    varchar(50),
 "FrenchProductName"     varchar(50),
 "StandardCost"          number(38,0),
 "FinishedGoodsFlag"     number(38,0) NOT NULL,
 "Color"                 varchar(15) NOT NULL,
 "SafetyStockLevel"      number(38,0),
 "ReorderPoint"          number(38,0),
 "ListPrice"             number(38,0),
 "Size"                  varchar(50),
 "SizeRange"             varchar(50),
 "Weight"                float,
 "DaysToManufacture"     number(38,0),
 "ProductLine"           varchar(2),
 "DealerPrice"           number(38,0),
 "Class"                 varchar(2),
 "Style"                 varchar(2),
 "ModelName"             varchar(50),
 "EnglishDescription"    varchar(400),
 "FrenchDescription"     varchar(400),
 "ChineseDescription"    varchar(400),
 "ArabicDescription"     varchar(400),
 "HebrewDescription"     varchar(400),
 "ThaiDescription"       varchar(400),
 "GermanDescription"     varchar(400),
 "JapaneseDescription"   varchar(400),
 "TurkishDescription"    varchar(400),
 "Status"                varchar(7),
 CONSTRAINT "PK_DimProduct" PRIMARY KEY ( "ProductKey" ),
 CONSTRAINT "FK_DimProduct_407" FOREIGN KEY ( "ProductSubcategoryKey" ) REFERENCES "EDW"."DimProductSubcategory" ( "ProductSubcategoryKey" )
);


-- ************************************** "EDW"."FactResellerSales"
CREATE TABLE "EDW"."FactResellerSales"
(
 "ProductKey"            number(38,0) NOT NULL,
 "OrderDateKey"          number(38,0) NOT NULL,
 "DueDateKey"            number(38,0) NOT NULL,
 "ShipDateKey"           number(38,0) NOT NULL,
 "ResellerKey"           number(38,0) NOT NULL,
 "EmployeeKey"           number(38,0) NOT NULL,
 "PromotionKey"          number(38,0) NOT NULL,
 "CurrencyKey"           number(38,0) NOT NULL,
 "SalesTerritoryKey"     number(38,0) NOT NULL,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "SalesOrderLineNumber"  number(38,0) NOT NULL,
 "RevisionNumber"        number(38,0),
 "OrderQuantity"         number(38,0),
 "UnitPrice"             number(38,0),
 "ExtendedAmount"        number(38,0),
 "UnitPriceDiscountPct"  float,
 "DiscountAmount"        float,
 "ProductStandardCost"   number(38,0),
 "TotalProductCost"      number(38,0),
 "SalesAmount"           number(38,0),
 "TaxAmt"                number(38,0),
 "Freight"               number(38,0),
 "CarrierTrackingNumber" varchar(25),
 "CustomerPONumber"      varchar(25),
 CONSTRAINT "FK_FactResellerSales_445" FOREIGN KEY ( "ProductKey" ) REFERENCES "EDW"."DimProduct" ( "ProductKey" ),
 CONSTRAINT "FK_FactResellerSales_447" FOREIGN KEY ( "ResellerKey" ) REFERENCES "EDW"."DimReseller" ( "ResellerKey" ),
 CONSTRAINT "FK_FactResellerSales_449" FOREIGN KEY ( "EmployeeKey" ) REFERENCES "EDW"."DimEmployee" ( "EmployeeKey" ),
 CONSTRAINT "FK_FactResellerSales_451" FOREIGN KEY ( "PromotionKey" ) REFERENCES "EDW"."DimPromotion" ( "PromotionKey" ),
 CONSTRAINT "FK_FactResellerSales_453" FOREIGN KEY ( "CurrencyKey" ) REFERENCES "EDW"."DimCurrency" ( "CurrencyKey" ),
 CONSTRAINT "FK_FactResellerSales_455" FOREIGN KEY ( "SalesTerritoryKey" ) REFERENCES "EDW"."DimSalesTerritory" ( "SalesTerritoryKey" ),
 CONSTRAINT "FK_FactResellerSales_457" FOREIGN KEY ( "OrderDateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" ),
 CONSTRAINT "FK_FactResellerSales_459" FOREIGN KEY ( "DueDateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" ),
 CONSTRAINT "FK_FactResellerSales_461" FOREIGN KEY ( "ShipDateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" )
)
COMMENT = 'Fact data of Reseller Sales';


-- ************************************** "EDW"."FactInternetSales"
CREATE TABLE "EDW"."FactInternetSales"
(
 "ProductKey"            number(38,0) NOT NULL,
 "OrderDateKey"          number(38,0) NOT NULL,
 "DueDateKey"            number(38,0) NOT NULL,
 "ShipDateKey"           number(38,0) NOT NULL,
 "CustomerKey"           number(38,0) NOT NULL,
 "PromotionKey"          number(38,0) NOT NULL,
 "CurrencyKey"           number(38,0) NOT NULL,
 "SalesTerritoryKey"     number(38,0) NOT NULL,
 "SalesOrderNumber"      varchar(20) NOT NULL,
 "SalesOrderLineNumber"  number(38,0) NOT NULL,
 "RevisionNumber"        number(38,0) NOT NULL,
 "OrderQuantity"         number(38,0) NOT NULL,
 "UnitPrice"             number(38,0) NOT NULL,
 "ExtendedAmount"        number(38,0) NOT NULL,
 "UnitPriceDiscountPct"  float NOT NULL,
 "DiscountAmount"        float NOT NULL,
 "ProductStandardCost"   number(38,0) NOT NULL,
 "TotalProductCost"      number(38,0) NOT NULL,
 "SalesAmount"           number(38,0) NOT NULL,
 "TaxAmt"                number(38,0) NOT NULL,
 "Freight"               number(38,0) NOT NULL,
 "CarrierTrackingNumber" varchar(25),
 "CustomerPONumber"      varchar(25),
 CONSTRAINT "FK_FactInternetSales_427" FOREIGN KEY ( "ProductKey" ) REFERENCES "EDW"."DimProduct" ( "ProductKey" ),
 CONSTRAINT "FK_FactInternetSales_429" FOREIGN KEY ( "CustomerKey" ) REFERENCES "EDW"."DimCustomer" ( "CustomerKey" ),
 CONSTRAINT "FK_FactInternetSales_431" FOREIGN KEY ( "PromotionKey" ) REFERENCES "EDW"."DimPromotion" ( "PromotionKey" ),
 CONSTRAINT "FK_FactInternetSales_433" FOREIGN KEY ( "CurrencyKey" ) REFERENCES "EDW"."DimCurrency" ( "CurrencyKey" ),
 CONSTRAINT "FK_FactInternetSales_435" FOREIGN KEY ( "SalesTerritoryKey" ) REFERENCES "EDW"."DimSalesTerritory" ( "SalesTerritoryKey" ),
 CONSTRAINT "FK_FactInternetSales_437" FOREIGN KEY ( "OrderDateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" ),
 CONSTRAINT "FK_FactInternetSales_439" FOREIGN KEY ( "DueDateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" ),
 CONSTRAINT "FK_FactInternetSales_441" FOREIGN KEY ( "ShipDateKey" ) REFERENCES "EDW"."DimDate" ( "DateKey" )
)
COMMENT = 'Fact table to hold Currency Data';


-- ************************************** "EDW"."SampleView"
Create View EDW.SampleView

  Comment = 'This is SampleView Comment'

AS
(
    -- Please type View Definition here
    SELECT 
           FinanceKey, 
           OrganizationKey,  
           AccountKey, 
           ScenarioKey
    FROM 
        EDW.FactFinance ff
         
);

