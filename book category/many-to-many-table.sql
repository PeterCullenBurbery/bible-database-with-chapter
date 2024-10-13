CREATE TABLE book_belongs_to_many_book_categories_and_book_category_contains_multiple_books (
    book_belongs_to_many_book_categories_and_book_category_contains_multiple_books_id RAW(16) DEFAULT sys_guid() PRIMARY KEY,
    book_belongs_to_many_book_categories_and_book_category_contains_multiple_books    VARCHAR2(1000),
    CONSTRAINT unique_joining_table_of_book_and_book_category UNIQUE ( book_belongs_to_many_book_categories_and_book_category_contains_multiple_books
    ),
    -- the not null constraint is important
    book_id                                                                           RAW(16) NOT NULL,
    book_category_id                                                                  RAW(16) NOT NULL,
    -- we add 2 foreign key constraints for many-to-many relationship
    FOREIGN KEY ( book_id )
        REFERENCES book ( book_id ),
    FOREIGN KEY ( book_category_id )
        REFERENCES book_category ( book_category_id ),
    -- we add a unique constraint
    UNIQUE ( book_id,
             book_category_id ),
    -- Additional columns for note and dates
    note                                                                              VARCHAR2(4000),  -- General-purpose note field
    date_created                                                                      TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp
    (9) NOT NULL,
    date_updated                                                                      TIMESTAMP(9) WITH TIME ZONE,
        date_created_or_updated                                                           TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS
        AS ( coalesce(date_updated, date_created) ) VIRTUAL
);

CREATE OR REPLACE TRIGGER trigger_set_date_updated_book_belongs_to_many_book_categories_and_book_category_contains_multiple_books BEFORE
    UPDATE ON book_belongs_to_many_book_categories_and_book_category_contains_multiple_books
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp;
END;
/