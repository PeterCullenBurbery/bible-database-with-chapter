CREATE TABLE FAQ (
    FAQ            VARCHAR2(4000),
    answer varchar2(4000),
    -- Additional columns for note and dates
    note                   VARCHAR2(4000),  -- General-purpose note field
    date_created           TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated           TIMESTAMP(9) WITH TIME ZONE,
    date_created_or_updated TIMESTAMP(9) WITH TIME ZONE GENERATED ALWAYS AS ( coalesce(date_updated, date_created) ) VIRTUAL,
    FAQ_id         RAW(16) DEFAULT sys_guid() PRIMARY KEY
);

-- Trigger to update date_updated for FAQ
CREATE OR REPLACE TRIGGER set_date_updated_FAQ
    BEFORE UPDATE ON FAQ
    FOR EACH ROW
BEGIN
    :new.date_updated := systimestamp;
END;
/
