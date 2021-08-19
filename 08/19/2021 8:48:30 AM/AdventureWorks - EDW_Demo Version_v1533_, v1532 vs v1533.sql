-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

DROP TABLE "EDW"."FactCurrencyRate";

ALTER TABLE "EDW"."DimScenario"
    ADD COLUMN "TestCol" varchar(50) NOT NULL;

CREATE TABLE "EDW"."TestTable"
(
 "ScenarioKey" number(38,0) NOT NULL,
 "CreatedBy"   varchar(50) NOT NULL COMMENT 'Who Created this Scenario',
 "CreatedDate" timestamp_ntz(9) NOT NULL COMMENT 'Scenario Creation Date',
 "UpdatedDate" timestamp_ntz(9) NOT NULL,
 "UpdatedBy"   varchar(50) NOT NULL,
 CONSTRAINT "FK_612" FOREIGN KEY ( "ScenarioKey" ) REFERENCES "EDW"."DimScenario" ( "ScenarioKey" )
);