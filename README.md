# Academic Contribution Registry

## Project Overview

The Academic Contribution Registry is a SQLite database designed to track researchers, their publications, contribution roles, research topics, and administrative audits. This project demonstrates the complete database design lifecycle—from business requirements analysis through conceptual modeling (UML), logical modeling (crow's foot ERD), and implementation in relational normal form (BCNF).

The database enables researchers to manage publication records, assign contributors with specific roles, organize research by topic, and maintain an audit trail of all modifications to the system.

## Files in This Repository

**Core Database Files:**
- `schema.sql` – Defines the complete relational schema in BCNF, including all tables, constraints, and relationships
- `seed.sql` – Populates the database with sample data for testing and demonstration

**Design Documentation:**
- `diagrams/` – Contains UML conceptual model and crow's foot ERD diagrams, along with Lucidchart links to both
- `proof-of-schema/` – Verification that the schema meets BCNF requirements, along with proof of working constraints
- `proof-of-queries/` – Query output and validation results

**Query Demonstrations:**
- `queries/q1.sql` – Retrieves researchers, their publications, assigned roles, and verification status. Demonstrates joins of four tables.
- `queries/q2.sql` – Finds researchers who contributed to publications on a specific topic. Demonstrates subquery usage.
- `queries/q3.sql` – Identifies publications with multiple contributors. Demonstrates GROUP BY with HAVING clause.
- `queries/q4.sql` – Lists published journals and under-review papers from 2025 onward. Demonstrates complex search conditions with logical operators.
- `queries/q5.sql` – Labels publications as "High Collaboration" or "Low Collaboration" based on contributor count. Demonstrates CASE WHEN conditional logic.

## How to Run the Project

**Using VSCode with SQLite Extension:**

1. Install the SQLite extension for VSCode
2. Open the Command Palette and select "SQLite: Open Database"
3. Create a new database file or select an existing one
4. Open schema.sql and run it against the database
5. Open seed.sql and run it to populate data
6. Open individual query files in queries/ and execute them

## Assignment Requirements Covered

**(10 pts) Requirements & Problem Domain Analysis**
- Requirements document identifying database rules in problem domain language
- Enumeration of nouns (entities) and actions (relationships) extracted from requirements

**(15 pts) Conceptual Model (UML)**
- Conceptual UML model created in LucidChart with minimum three classes
- Includes one-to-many and many-to-many relationships with full multiplicity constraints
- Classes include proper names, descriptions, and attributes with domain types
- Model contains fewer than 10 entities

**(10 pts) Logical Data Model (ERD)**
- Crow's foot ERD derived from the conceptual model
- All many-to-many relationships converted to association entities
- Fully normalized relational structure

**(15 pts) Relational Schema in BCNF**
- Relational schema defined with 6-10 relations
- Functional dependencies documented and analyzed
- Schema verified to be in Boyce-Codd Normal Form (BCNF)

**(10 pts) SQL Data Definition Language**
- Complete `schema.sql` with CREATE TABLE statements for all relations
- Constraints, primary keys, foreign keys, and data types properly defined
- Schema verified to execute successfully in SQLite3

**(10 pts) Test Data Population**
- `seed.sql` populated with realistic sample data
- Test data covers all tables and enables meaningful query results
- Data generated using data generation tools

**(10 pts) Query Demonstrations**
- Five SQL queries meeting all specified criteria:
  - **Q1**: Multi-table join (4 tables) showing researcher contributions
  - **Q2**: Subquery identifying researchers by publication topic
  - **Q3**: GROUP BY with HAVING clause filtering publications by contributor count
  - **Q4**: Complex search conditions using logical operators (OR) on multiple expressions
  - **Q5**: CASE WHEN conditional logic for dynamic labeling

## Tools Used

- SQLite3 – Relational database management system
- SQL – Data definition and query language
- Lucidchart – Conceptual and logical data modeling (diagrams referenced in documentation)
- AI usage (GPT 4.1) for seed.sql - populating with realistic sample data, automates tedious process
