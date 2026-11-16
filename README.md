# Lab 4: Search Queries in SQL (Problem 2: Library)

Website from Lab 2 and Lab 3 (login, to-do list, books and authors), now with the Lab 4 search pages: a library of six tables (authors, publishers, categories, books, members, loans).

## 1. Students
| Name | ID |
|------|----|
| Aly Badawy | 2304123 |
| Joumana Mohamed | 2304067 |


## 2. Technology
- Back end: Python 3 + Flask, PyMySQL (SQL with `%s` placeholders, no ORM), bcrypt, python-dotenv
- Front end: HTML (Jinja templates), CSS, JavaScript
- Database: MySQL 8: `registration` (Lab 2) and `library` (Labs 3 and 4)

## 3. Folder
```
problem2_DDL.sql      creates database `library`: author, publisher, category, book, member, loan
problem2_DML.sql      seed data: 6 authors, 3 publishers, 3 categories, 10 books, 5 members, 12 loans
problem2_Queries.sql  the SQL of the pages F2.1 to F2.6, each one after a "-- F2.x" comment
website/              the website
```

## 4. How to run it (Windows, step by step)
1. Install Python 3.10+ and MySQL 8.
2. Open **Command Prompt** (cmd) in this folder. In PowerShell the `<` symbol does not work; use cmd.
   If `mysql` is not found, run `set "PATH=%PATH%;C:\Program Files\MySQL\MySQL Server 8.0\bin"` first.
3. Build the databases (each script can be re-run at any time):
   ```
   mysql -u root -p < problem2_DDL.sql
   mysql -u root -p < problem2_DML.sql
   mysql -u root -p < website\database\registration_schema.sql
   ```
4. Run the queries by hand (optional): `mysql -u root -p < problem2_Queries.sql`
5. Install the packages:
   ```
   cd website
   python -m venv venv
   venv\Scripts\activate
   pip install -r requirements.txt
   ```
6. Copy `.env.example` to `.env` (`copy .env.example .env`) and write your MySQL password and a random `SECRET_KEY`.
7. Start the server: `python app.py`
8. Open http://127.0.0.1:5000, **register** an account, then click **Library**. The search pages are the tabs under the title.

(Linux / Mac: the same, with `source venv/bin/activate` and `cp .env.example .env`.)

## 5. Search pages
| Req. | Page | What it does |
|------|------|--------------|
| F2.1 | `/search` | Title keyword (`LIKE`), minimum and maximum price (`BETWEEN`), category list; cheapest first |
| F2.2 | `/catalogue` | All books with the author, publisher and category names (`JOIN`) |
| F2.3 | `/reports` | Books and average price per category; authors with at least 2 books; total, smallest and largest price |
| F2.4 | `/loans` | Loans not returned yet; members who never borrowed; books never borrowed (`JOIN`, `LEFT JOIN`) |
| F2.5 | `/most-borrowed` | The 3 books with the most loans and the member with the most loans |
| F2.6 | `/authors-books` | Every author with the number of books (including 0); books whose author and publisher share a country |
| Bonus | `/search` | The text typed by the user travels only as `%s` placeholders, never inside the SQL text. `%` and `_` typed in the keyword are searched as normal characters |

The SQL of each page is the same text as in `problem2_Queries.sql`.

## 6. Earlier features (unchanged)
Lab 3: add, edit and delete books and authors, with optional cover and photo (`/library`). Deleting an author deletes the author's books, and deleting a book deletes its loans (`ON DELETE CASCADE`). The book form now also asks for the publish year, publisher and category.
Lab 2: register, login, logout, private to-do list, dark mode.
