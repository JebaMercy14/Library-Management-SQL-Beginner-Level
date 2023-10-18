-- Connect to or create a new SQLite database
sqlite3 library.db

-- Create tables
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    author TEXT,
    genre TEXT,
    total_copies INTEGER,
    available_copies INTEGER
);

CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    username TEXT,
    password TEXT
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    member_id INTEGER,
    book_id INTEGER,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    fine REAL
);

/*Insert a book into the books table:*/
INSERT INTO books (title, author, genre, total_copies, available_copies) VALUES ('Book Title', 'Author Name', 'Genre', 5, 5);

/*Register a member:*/
INSERT INTO members (name, email, username, password) VALUES ('Member Name', 'member@email.com', 'username', 'hashed_password');

/*Borrow a book:*/
-- Assuming 'member_id' and 'book_id' are known
INSERT INTO transactions (member_id, book_id, borrow_date, due_date) VALUES (1, 1, '2023-10-18', '2023-11-18');

/*Return a book and calculate the fine:*/
-- Update the 'return_date' and calculate the fine (if any)
UPDATE transactions
SET return_date = '2023-10-25', fine = (julianday('2023-10-25') - julianday('2023-11-18')) * 0.50
WHERE transaction_id = 1;

/*Search for available books by a specific author*/
SELECT * FROM books WHERE author = 'Author Name' AND available_copies > 0;
