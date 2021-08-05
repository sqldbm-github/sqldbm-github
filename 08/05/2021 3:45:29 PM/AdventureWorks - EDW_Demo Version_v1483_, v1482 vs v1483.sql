-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE "EDW"."NewFactCurrencyRate"
    DROP CONSTRAINT "FK_NewFactCurrencyRate_471";

ALTER TABLE "EDW"."FactSurveyResponse"
    DROP CONSTRAINT "FK_FactSurveyResponse_465";

ALTER TABLE "EDW"."FactSalesQuota"
    DROP CONSTRAINT "FK_FactSalesQuota_463";

ALTER TABLE "EDW"."FactProductInventory"
    DROP CONSTRAINT "FK_FactProductInventory_443";

ALTER TABLE "EDW"."FactFinance"
    DROP CONSTRAINT "FK_FactFinance_417";

ALTER TABLE "EDW"."DimDate"
    DROP CONSTRAINT "PK_DimDate";

ALTER TABLE "EDW"."DimDate"
    DROP COLUMN "DateKey";

ALTER TABLE "EDW"."DimDate"
    ADD COLUMN "DateKeyTest" number(38,0) NOT NULL;

ALTER TABLE "EDW"."NewFactCurrencyRate"
    DROP COLUMN "DateKey";

ALTER TABLE "EDW"."NewFactCurrencyRate"
    ADD COLUMN "DateKeyTest" number(38,0);

ALTER TABLE "EDW"."FactSurveyResponse"
    DROP COLUMN "DateKey";

ALTER TABLE "EDW"."FactSurveyResponse"
    ADD COLUMN "DateKeyTest" number(38,0) NOT NULL;

ALTER TABLE "EDW"."FactSalesQuota"
    DROP COLUMN "DateKey";

ALTER TABLE "EDW"."FactSalesQuota"
    ADD COLUMN "DateKeyTest" number(38,0) NOT NULL;

ALTER TABLE "EDW"."FactProductInventory"
    DROP COLUMN "DateKey";

ALTER TABLE "EDW"."FactProductInventory"
    ADD COLUMN "DateKeyTest" number(38,0) NOT NULL;

ALTER TABLE "EDW"."FactFinance"
    DROP COLUMN "DateKey";

ALTER TABLE "EDW"."FactFinance"
    ADD COLUMN "DateKeyTest" number(38,0) NOT NULL;

ALTER TABLE "EDW"."FactResellerSales"
    DROP COLUMN "CustomerPONumber";

ALTER TABLE "EDW"."DimDate"
    ADD CONSTRAINT "PK_DimDate" PRIMARY KEY ("DateKeyTest");

ALTER TABLE "EDW"."NewFactCurrencyRate"
    ADD CONSTRAINT "FK_NewFactCurrencyRate_471" FOREIGN KEY ("DateKeyTest") REFERENCES "EDW"."DimDate" ("DateKeyTest");

ALTER TABLE "EDW"."FactSurveyResponse"
    ADD CONSTRAINT "FK_FactSurveyResponse_465" FOREIGN KEY ("DateKeyTest") REFERENCES "EDW"."DimDate" ("DateKeyTest");

ALTER TABLE "EDW"."FactSalesQuota"
    ADD CONSTRAINT "FK_FactSalesQuota_463" FOREIGN KEY ("DateKeyTest") REFERENCES "EDW"."DimDate" ("DateKeyTest");

ALTER TABLE "EDW"."FactProductInventory"
    ADD CONSTRAINT "FK_FactProductInventory_443" FOREIGN KEY ("DateKeyTest") REFERENCES "EDW"."DimDate" ("DateKeyTest");

ALTER TABLE "EDW"."FactFinance"
    ADD CONSTRAINT "FK_FactFinance_417" FOREIGN KEY ("DateKeyTest") REFERENCES "EDW"."DimDate" ("DateKeyTest");