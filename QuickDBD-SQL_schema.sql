-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/AcNako
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Department_Number" varchar   NOT NULL,
    "Department_Name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_Number"
     )
);

CREATE TABLE "Department_Employees" (
    "Employee_Number" int   NOT NULL,
    "Department_Number" varchar   NOT NULL,
    CONSTRAINT "pk_Department_Employees" PRIMARY KEY (
        "Employee_Number","Department_Number"
     )
);

CREATE TABLE "Department_Manager" (
    "Department_Number" varchar   NOT NULL,
    "Employee_Number" int   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "Department_Number","Employee_Number"
     )
);

CREATE TABLE "Employees" (
    "Employee_Number" int   NOT NULL,
    "Employee_title" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_Number"
     )
);

CREATE TABLE "Salaries" (
    "Employee_Number" int   NOT NULL,
    "Salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Employee_Number"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Department_Number" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Department_Number" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Employee_title" FOREIGN KEY("Employee_title")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

