-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT "AdventureWorksDW.EDW.FILEFORMAT_431"
    TYPE = JSON;

DROP FILE FORMAT "ADVENTUREWORKSDW_BETA.EDW.FILEFORMAT_431";

CREATE SCHEMA "AdventureWorksDW.EDW";

DROP SCHEMA "ADVENTUREWORKSDW_BETA.EDW";

ALTER TABLE "EDW"."DimOrganization"
    SET COMMENT = 'Dimension for Organizational Data';

ALTER TABLE "EDW"."FactFinance"
    SET COMMENT = 'Facts for Finance';

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