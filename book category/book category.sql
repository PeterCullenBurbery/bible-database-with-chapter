WITH five_books_of_moses_book_category_id AS (
    SELECT
        book_category_id
    FROM
        book_category
    WHERE
        REGEXP_LIKE ( book_category,
                      'Moses',
                      'i' )
)
SELECT
    book_id,
    five_books_of_moses_book_category_id
FROM
    book
WHERE
    book_number BETWEEN 1 AND 5;

SELECT
    book_category_id
FROM
    book_category
WHERE
    REGEXP_LIKE ( book_category,
                  'Moses',
                  'i' );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              'Moses',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 1
        AND "A1"."BOOK_NUMBER" <= 5;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^old covenant',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 1
        AND "A1"."BOOK_NUMBER" <= 39;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^new covenant',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 39
        AND "A1"."BOOK_NUMBER" <= 66;

SELECT
    book_id
FROM
    book
WHERE
    REGEXP_LIKE ( book,
                  '(Acts)',
                  'i' )
    OR book_number BETWEEN 6 AND 17;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        book_id,
        (
            SELECT
                book_category_id
            FROM
                book_category
            WHERE
                REGEXP_LIKE ( book_category,
                              '^historical books$',
                              'i' )
        )
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK"
    WHERE
        REGEXP_LIKE ( book,
                      '(Acts)',
                      'i' )
        OR book_number BETWEEN 6 AND 17;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^wisdom',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 18
        AND "A1"."BOOK_NUMBER" <= 22;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^major',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 23
        AND "A1"."BOOK_NUMBER" <= 27;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^minor',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 28
        AND "A1"."BOOK_NUMBER" <= 39;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^synoptic gospels',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= 40
        AND "A1"."BOOK_NUMBER" <= 42;

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^Paul''s letters to churches',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= (
                SELECT
                    book_number
                FROM
                    book
                WHERE
                    REGEXP_LIKE ( book,
                                  'Romans',
                                  'i' )
            )
        AND "A1"."BOOK_NUMBER" <= (
            SELECT
                book_number
            FROM
                book
            WHERE
                REGEXP_LIKE ( book,
                              'Thes\w* 2',
                              'i' )
        );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^Paul''s letters to pastors',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= (
                SELECT
                    book_number
                FROM
                    book
                WHERE
                    REGEXP_LIKE ( book,
                                  'Timothy 1',
                                  'i' )
            )
        AND "A1"."BOOK_NUMBER" <= (
            SELECT
                book_number
            FROM
                book
            WHERE
                REGEXP_LIKE ( book,
                              'Titus',
                              'i' )
        );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^general epistles',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
            "A1"."BOOK_NUMBER" >= (
                SELECT
                    book_number
                FROM
                    book
                WHERE
                    REGEXP_LIKE ( book,
                                  'James',
                                  'i' )
            )
        AND "A1"."BOOK_NUMBER" <= (
            SELECT
                book_number
            FROM
                book
            WHERE
                REGEXP_LIKE ( book,
                              'Jude',
                              'i' )
        );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        "A1"."BOOK_ID" "BOOK_ID",
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^books in 1',
                              'i' )
        )              "1"
    FROM
        "BIBLE_DATABASE_WITH_CHAPTER"."BOOK" "A1"
    WHERE
        REGEXP_LIKE ( "BOOK",
                      '(Acts)|(Philemon)|(Hebrews)|(Revelation)|(John)',
                      'i' );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        book_id,
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^Historical books of the Old Covenant',
                              'i' )
        )
    FROM
        (
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
                              'i' )
        );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        book_id,
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^Historical book of the New Testament',
                              'i' )
        )
    FROM
        (
            SELECT
                book_id
            FROM
                book_category_many_to_many
            WHERE
                REGEXP_LIKE ( book_category,
                              '^his',
                              'i' )
            MINUS
            SELECT
                book_id
            FROM
                book_category_many_to_many
            WHERE
                REGEXP_LIKE ( book_category,
                              '^old',
                              'i' )
        );

SELECT
    *
FROM
    book_category
WHERE
    REGEXP_LIKE ( book_category,
                  'prophets',
                  'i' );

INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        book_id,
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^Prophets',
                              'i' )
        )
    FROM
        (
            SELECT
                book_id
            FROM
                book_category_many_to_many
            WHERE
                REGEXP_LIKE ( book_category,
                              '^major proph',
                              'i' )
            UNION
            SELECT
                book_id
            FROM
                book_category_many_to_many
            WHERE
                REGEXP_LIKE ( book_category,
                              '^minor prop',
                              'i' )
        );

DELETE FROM book_belongs_to_many_book_categories_and_book_category_contains_multiple_books
WHERE
    book_category_id = (
        SELECT
            book_category_id
        FROM
            book_category
        WHERE
            REGEXP_LIKE ( book_category,
                          '^Prophets',
                          'i' )
    );
INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_id,
    book_category_id
)
    SELECT
        book_id,
        (
            SELECT
                "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
            FROM
                "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
            WHERE
                REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
                              '^Gospel',
                              'i' )
        )
    FROM
        (
            SELECT
                book_id
            FROM
                book_category_many_to_many
            WHERE
                REGEXP_LIKE ( book_category,
                              '^Synoptic gospels',
                              'i' )
            UNION
            SELECT
                book_id
            FROM
                book
            WHERE
                REGEXP_LIKE ( book,
                              '^John$',
                              'i' )
        );
--INSERT INTO book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
--    book_id,
--    book_category_id
--)
--SELECT
--    book_id,
--    (
--        SELECT
--            "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
--        FROM
--            "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
--        WHERE
--            REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
--                          '^Paul''s letters$',
--                          'i' )
--    )
--FROM
--    (
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE ( book_category,
--                          '^Paul''s letters to churches',
--                          'i' )
--        UNION
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE ( book_category,
--                          '^Paul''s letters to pastors',
--                          'i' )
--        UNION
--        SELECT
--            book_id
--        FROM
--            book
--        WHERE
--            REGEXP_LIKE ( book,
--                          '^John$',
--                          'i' )
--    );
--select book_id,(select 1 from dual) from(  SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE(book_category, '^Paul''s letters to churches', 'i')
--        UNION
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE(book_category, '^Paul''s letters to pastors', 'i')
--        UNION
--        SELECT
--            book_id
--        FROM
--            book
--        WHERE
--            REGEXP_LIKE(book, '^John$', 'i'));
--SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE(book_category, '^Paul''s letters to churches', 'i')
--        UNION
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE(book_category, '^Paul''s letters to pastors', 'i')
--        UNION
--        SELECT
--            book_id
--        FROM
--            book
--        WHERE
--            REGEXP_LIKE(book, '^John$', 'i');
--SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE(book_category, '^Paul''s letters to churches', 'i')
--        UNION
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE(book_category, '^Paul''s letters to pastors', 'i')
--        UNION
--        SELECT
--            book_id
--        FROM
--            book
--        WHERE
--            REGEXP_LIKE(book, '^John$', 'i')
--SELECT
--    book_id,
--    (
--        SELECT
--            "A2"."BOOK_CATEGORY_ID" "BOOK_CATEGORY_ID"
--        FROM
--            "BIBLE_DATABASE_WITH_CHAPTER"."BOOK_CATEGORY" "A2"
--        WHERE
--            REGEXP_LIKE ( "A2"."BOOK_CATEGORY",
--                          '^Paul''s letters$',
--                          'i' )
--    )
--FROM
--    (
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE ( book_category,
--                          '^Paul''s letters to churches',
--                          'i' )
--        UNION
--        SELECT
--            book_id
--        FROM
--            book_category_many_to_many
--        WHERE
--            REGEXP_LIKE ( book_category,
--                          '^Paul''s letters to pastors',
--                          'i' )
--        UNION
--        SELECT
--            book_id
--        FROM
--            book
--        WHERE
--            REGEXP_LIKE ( book,
--                          '^John$',
--                          'i' )
--    );