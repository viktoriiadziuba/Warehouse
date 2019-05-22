CREATE TABLE "supplier" (
	"supplier_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT supplier_pk PRIMARY KEY ("supplier_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "product" (
	"poduct_id" serial NOT NULL,
	"type" varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" TEXT,
	"storage_id" integer NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY ("poduct_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "order" (
	"order_id" serial NOT NULL,
	"date_of_order" DATE NOT NULL,
	"closing_date" DATE NOT NULL,
	CONSTRAINT order_pk PRIMARY KEY ("order_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "storage" (
	"storage_id" serial NOT NULL,
	"capacity" integer NOT NULL,
	CONSTRAINT storage_pk PRIMARY KEY ("storage_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "client" (
	"client_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"surname" varchar(255) NOT NULL,
	"phone_number" varchar(255) NOT NULL UNIQUE,
	"email" varchar(255) NOT NULL UNIQUE,
	"date_of_birth" DATE NOT NULL,
	CONSTRAINT client_pk PRIMARY KEY ("client_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "employee" (
	"employee_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"surname" varchar(255) NOT NULL,
	"phone_number" varchar(255) NOT NULL UNIQUE,
	"email" varchar(255) UNIQUE,
	"date_of_birth" DATE NOT NULL,
	CONSTRAINT employee_pk PRIMARY KEY ("employee_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "country" (
	"country_id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT country_pk PRIMARY KEY ("country_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "product" ADD CONSTRAINT "product_fk0" FOREIGN KEY ("poduct_id") REFERENCES "supplier"("supplier_id");
ALTER TABLE "product" ADD CONSTRAINT "product_fk1" FOREIGN KEY ("storage_id") REFERENCES "storage"("storage_id");

ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("order_id") REFERENCES "product"("poduct_id");


ALTER TABLE "client" ADD CONSTRAINT "client_fk0" FOREIGN KEY ("client_id") REFERENCES "order"("order_id");

ALTER TABLE "employee" ADD CONSTRAINT "employee_fk0" FOREIGN KEY ("employee_id") REFERENCES "client"("client_id");

ALTER TABLE "country" ADD CONSTRAINT "country_fk0" FOREIGN KEY ("country_id") REFERENCES "supplier"("supplier_id");

