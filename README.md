# SQL Challenge

# Table of Contents
- [1.0 Introduction](#1-introduction)
- [2.0 Solving the Challenge](#2-solving-the-challenge)
-   [2.1 Entity Relationship Diagram](#2.1-Entity-Relationship-Diagram)
-   [2.2 Data Engineering](#2.2-Data-Engineering)
-   [2.3 Data Queries](#2.3-Data-Queries)
-   [2.4 Data Analytics](#2.4-Data-Analytics)
- [3.0 Project Structure](#3.0-roject-Structure)
- [4.0 Data Analytics](#4.0-Data-Analytics)

# 1.0 Introduction
The topic for this time is about `SQL`. In this challenge we are tasks to:
1. Develop ERD (Entity Relationship Diagram)
2. Data Engineering - Develop and merge database for Employee/Department/Manager using data modelling
3. Data Query from the databases
4. Data analytics

# 2.0 Solving the Challenge

## 2.1 Entity Relationship Diagram
The ERD has been developed for this challenge and can be found below in Figure 1.
![ERD for Employees/Managers/Departements](output\Employee_ERD.png). I have difficulties to use the suggested diagram, hence i used other web based [tool](https://app.diagrams.net/) that is recommended by Class Instructor during class .

## 2.2 Data Engineering
THe following tables are created in schemas:
1. All 3NF tables, e.g. Departments, Titles, Employees
2. All junction table that contain PK and FK to connect between the 3NF tables, .e.g. Department Managers, Salaries, Employee's department
3. Final Employees and Managers Tables by joining all the 3NF tables through the junction tables
4. The `schemas` table generated by using the `sql` `query` and stored as `schema.sql` 

## 2.3 Data Queries
There are 8 requested queries, this are stored within `query.sql`. The stuctures of the project is presented in [Section 3](#3.0-roject-Structure)

## 2.4 Data Analytics
Further analytics were performed using `Jupyter Notebook` and stored as `mysql.ipynb`to investigate the data deeper. The following were performed:
- import `postgresql` database to pandas using `sqlalchemy` library
- generated the histogram chart from the salary
- generate the bar chart for average salary based on the title of the employees
- print out 'my' employee no. 499942
- from the plotted salary histogram and average salary by title is not obvious if the data are fake. The suspicious data however, can be found when quering question no. 5 and 8. Too many coincidance that people have the same first name *Hercules* and hundreds of people with the same lastname. 

# 3.0 Project Structure
```
|__data # all input files
    |__*.csv
|__output
    |__*.csv
    |__*.png
|__Schemas_scripts # all *.sql and *.ipynb
```


