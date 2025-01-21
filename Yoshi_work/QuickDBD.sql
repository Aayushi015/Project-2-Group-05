-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(200)   NOT NULL,
    "project_description" varchar(200)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(200)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(200)   NOT NULL,
    "currency" varchar(200)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_ids" varchar(200)   NOT NULL,
    "subcategory_ids" varchar(200)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "email" varchar(200)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "category" (
    "category_ids" varchar(200)   NOT NULL,
    "category" varchar(200)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_ids"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_ids" varchar(200)   NOT NULL,
    "subcategory" varchar(200)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_ids"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_ids" FOREIGN KEY("category_ids")
REFERENCES "category" ("category_ids");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_ids" FOREIGN KEY("subcategory_ids")
REFERENCES "subcategory" ("subcategory_ids");

