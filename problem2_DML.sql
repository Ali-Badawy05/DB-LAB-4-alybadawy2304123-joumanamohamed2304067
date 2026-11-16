-- Problem 2: seed data
USE library;
INSERT INTO author (author_id, name, country) VALUES
    (1, 'Naguib Mahfouz',         'Egypt'),
    (2, 'Agatha Christie',        'United Kingdom'),
    (3, 'Gabriel Garcia Marquez', 'Colombia'),
    (4, 'Haruki Murakami',        'Japan'),
    (5, 'Taha Hussein',           'Egypt'),
    (6, 'Orhan Pamuk',            'Turkey');


INSERT INTO publisher (publisher_id, name, country) VALUES
    (1, 'Dar El Shorouk', 'Egypt'),
    (2, 'Penguin Books',  'United Kingdom'),
    (3, 'Vintage',        'United States');


INSERT INTO category (category_id, name) VALUES
    (1, 'Fiction'),
    (2, 'Mystery'),
    (3, 'Autobiography');


INSERT INTO book (book_id, title, price, publish_year, author_id, publisher_id, category_id) VALUES
    (1,  'Palace Walk',                    14.50, 1956, 1, 1, 1),
    (2,  'Midaq Alley',                    12.00, 1947, 1, 1, 1),
    (3,  'Miramar',                        11.25, 1967, 1, 1, 1),
    (4,  'Murder on the Orient Express',   10.99, 1934, 2, 2, 2),
    (5,  'And Then There Were None',        9.75, 1939, 2, 2, 2),
    (6,  'One Hundred Years of Solitude',  16.20, 1967, 3, 3, 1),
    (7,  'Love in the Time of Cholera',    15.40, 1985, 3, 3, 1),
    (8,  'Norwegian Wood',                 13.30, 1987, 4, 3, 1),
    (9,  'Kafka on the Shore',             17.80, 2002, 4, 3, 1),
    (10, 'The Days',                        8.90, 1929, 5, 1, 3);


INSERT INTO member (member_id, name, email, join_date) VALUES
    (1, 'Ahmed Hassan',  'ahmed.hassan@example.com',  '2026-01-10'),
    (2, 'Mona Samir',    'mona.samir@example.com',    '2026-02-14'),
    (3, 'Omar Khaled',   'omar.khaled@example.com',   '2026-03-03'),
    (4, 'Sara Mostafa',  'sara.mostafa@example.com',  '2026-04-21'),
    (5, 'Youssef Nabil', 'youssef.nabil@example.com', '2026-05-30');


INSERT INTO loan (loan_id, book_id, member_id, loan_date, return_date) VALUES
    (1,  6, 1, '2026-09-01', '2026-09-12'),
    (2,  1, 1, '2026-09-05', '2026-09-20'),
    (3,  6, 2, '2026-09-10', '2026-09-25'),
    (4,  4, 3, '2026-09-14', '2026-09-28'),
    (5,  1, 2, '2026-09-18', '2026-10-02'),
    (6,  6, 3, '2026-10-01', '2026-10-15'),
    (7,  2, 4, '2026-10-03', '2026-10-17'),
    (8,  1, 1, '2026-10-08', NULL),
    (9,  4, 4, '2026-10-12', '2026-10-26'),
    (10, 6, 1, '2026-10-20', NULL),
    (11, 5, 2, '2026-10-22', '2026-11-01'),
    (12, 7, 3, '2026-10-25', '2026-11-05');
