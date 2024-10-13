CREATE OR REPLACE VIEW book_category_many_to_many AS
    SELECT
        book,
        book_category,
        book_belongs_to_many_book_categories_and_book_category_contains_multiple_books.date_created,
        book_belongs_to_many_book_categories_and_book_category_contains_multiple_books.date_updated,
        book_belongs_to_many_book_categories_and_book_category_contains_multiple_books.date_created_or_updated,
        book.book_id,
        book.book_number
    FROM
             book_belongs_to_many_book_categories_and_book_category_contains_multiple_books
        JOIN book ON book.book_id = book_belongs_to_many_book_categories_and_book_category_contains_multiple_books.book_id
        JOIN book_category ON book_category.book_category_id = book_belongs_to_many_book_categories_and_book_category_contains_multiple_books.book_category_id
        ;

SELECT
    book,
    book_category
FROM
    book_category_many_to_many
ORDER BY
    date_created DESC,
    book_number ASC;

SELECT
    *
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^general',
                  'i' );

SELECT
    book
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^his',
                  'i' )
INTERSECT
SELECT
    book
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^old',
                  'i' );

SELECT
    book_id
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^his',
                  'i' )
INTERSECT
SELECT
    book_id
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^old',
                  'i' );

SELECT
    book
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^his',
                  'i' )
MINUS
SELECT
    book
FROM
    book_category_many_to_many
WHERE
    REGEXP_LIKE ( book_category,
                  '^old',
                  'i' );