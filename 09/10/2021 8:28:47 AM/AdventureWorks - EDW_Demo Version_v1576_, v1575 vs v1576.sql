-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

DROP TABLE "EDW"."FactCurrencyRate";

ALTER TABLE "EDW"."DimScenario"
    ADD COLUMN "TestCol" varchar(50) NOT NULL;

CREATE TABLE "EDW"."ChildDemo"
(
 "CreatedBy"   varchar(50) NOT NULL,
 "ScenarioKey" number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 "CreatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedBy"   varchar(50) NOT NULL,
 "ChildDemoId"  NOT NULL,
 CONSTRAINT "PK_618" PRIMARY KEY ( "ChildDemoId" )
);