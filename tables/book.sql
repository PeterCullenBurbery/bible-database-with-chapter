CREATE TABLE book (
    book                    VARCHAR2(4000) UNIQUE NOT NULL,
    book_number             NUMBER(*, 0) UNIQUE NOT NULL CHECK ( book_number > 0 ),
    CHECK ( book_number > 0 ),
    -- Additional columns for note and dates
    note                    VARCHAR2(4000),  -- General-purpose note field
    date_created            TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated            TIMESTAMP(9) WITH TIME ZONE,
        date_created_or_updated TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS AS ( coalesce(date_updated, date_created) ) VIRTUAL,
    book_id                 RAW(16) DEFAULT sys_guid() PRIMARY KEY
);

CREATE OR REPLACE TRIGGER book_compound_trigger FOR
    INSERT OR UPDATE ON book
COMPOUND TRIGGER

    -- Local variable to store max book_number for the statement-level trigger
    v_max_book_number NUMBER;

    -- Before statement: Initialize the max book_number
    BEFORE STATEMENT IS BEGIN
        -- Get the maximum book_number at the beginning of the statement
        SELECT
            nvl(MAX(book_number),
                0)
        INTO v_max_book_number
        FROM
            book;

    END BEFORE STATEMENT;

    -- Before each row for INSERT: Set book_number if NULL
    BEFORE EACH ROW IS BEGIN
        IF inserting THEN
            IF :new.book_number IS NULL THEN
                -- Set the new book_number to be 1 plus the current max book_number
                :new.book_number := v_max_book_number + 1;
                -- Update the max book_number for subsequent inserts within this statement
                v_max_book_number := :new.book_number;
            END IF;
        END IF;

        -- Update date_updated for each update
        IF updating THEN
            :new.date_updated := systimestamp;
        END IF;
    END BEFORE EACH ROW;

    -- After each row for UPDATE: Validate that book_number is not greater than v_max_book_number
    AFTER EACH ROW IS BEGIN
        IF updating THEN
            -- Check if the new book_number is greater than the max book_number for the statement
            IF :new.book_number > v_max_book_number THEN
                raise_application_error(-20001, 'Invalid book_number. Cannot update to a number greater than 1 + the current max.');
            END IF;

        END IF;
    END AFTER EACH ROW;
END book_compound_trigger;
/

ALTER TABLE book READ ONLY;