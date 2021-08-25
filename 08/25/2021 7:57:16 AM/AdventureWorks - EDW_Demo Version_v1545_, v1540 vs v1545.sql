-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "EDW"."DimEmployee"
    DROP CONSTRAINT "FK_DimEmployee_405";

ALTER TABLE "EDW"."FactResellerSales"
    DROP CONSTRAINT "FK_FactResellerSales_455";

ALTER TABLE "EDW"."FactInternetSales"
    DROP CONSTRAINT "FK_FactInternetSales_427";

ALTER TABLE "EDW"."FactInternetSales"
    DROP CONSTRAINT "FK_FactInternetSales_435";

DROP TABLE "EDW"."DimSalesTerritory";

ALTER TABLE "EDW"."DimEmployee"
    DROP COLUMN "SalesTerritoryKey";

ALTER TABLE "EDW"."FactResellerSales"
    DROP COLUMN "SalesTerritoryKey";

ALTER TABLE "EDW"."FactInternetSales"
    ALTER COLUMN "CustomerKey" DROP NOT NULL;

ALTER TABLE "EDW"."FactInternetSales"
    DROP COLUMN "ProductKey";

ALTER TABLE "EDW"."FactInternetSales"
    DROP COLUMN "SalesTerritoryKey";

ALTER TABLE "EDW"."FactInternetSales"
    ADD COLUMN "Test" number(38,0) NOT NULL;

ALTER TABLE "EDW"."FactInternetSales"
    ADD COLUMN "col_612"  NOT NULL;

CREATE TABLE "Test"
(
 "test" character NOT NULL,
 "name" varchar NOT NULL,
 CONSTRAINT "PK_test" PRIMARY KEY ( "test" )
);

ALTER TABLE "EDW"."FactInternetSales"
    ADD CONSTRAINT "FK_FactInternetSales_427" FOREIGN KEY ("Test") REFERENCES "EDW"."DimProduct" ("ProductKey");