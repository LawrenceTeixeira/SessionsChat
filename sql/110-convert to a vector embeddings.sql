-- This script converts the full name of each speaker in the web.speakers table to a vector embedding using the text-embedding-3-small model.
-- The generated embedding is then stored in the embeddings column of the web.speakers table.
-- The script uses a cursor to iterate over each speaker that does not yet have embeddings and generates the embedding for their full name.
DECLARE @speaker_id INT;
DECLARE @full_name NVARCHAR(MAX);
DECLARE @embedding VARBINARY(8000);

-- Cursor to iterate over each speaker that does not yet have embeddings
DECLARE speaker_cursor CURSOR FOR
    SELECT id, full_name
    FROM web.speakers
    WHERE embeddings IS NULL;

OPEN speaker_cursor;

FETCH NEXT FROM speaker_cursor INTO @speaker_id, @full_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generate the embedding for the speaker's full name
    EXEC GET_EMBEDDINGS 'text-embedding-3-small', @full_name, @embedding OUTPUT;

    -- Update the embeddings column with the generated embedding
    UPDATE web.speakers
    SET embeddings = @embedding
    WHERE id = @speaker_id;

    -- Fetch the next speaker
    FETCH NEXT FROM speaker_cursor INTO @speaker_id, @full_name;
END;

CLOSE speaker_cursor;
DEALLOCATE speaker_cursor;
--end of script

--This script converts the title and abstract of each session in the web.sessions table to a vector embedding using the text-embedding-3-small model.
--The generated embedding is then stored in the embeddings column of the web.sessions table.
--The script uses a cursor to iterate over each session that does not yet have embeddings and generates the embedding for their title and abstract.
DECLARE @session_id INT;
DECLARE @title NVARCHAR(200);
DECLARE @abstract NVARCHAR(MAX);
DECLARE @text NVARCHAR(MAX);
DECLARE @embedding VARBINARY(8000);

-- Cursor to iterate over each session that does not yet have embeddings
DECLARE session_cursor CURSOR FOR
    SELECT id, title, abstract
    FROM web.sessions
    WHERE embeddings IS NULL;

OPEN session_cursor;

FETCH NEXT FROM session_cursor INTO @session_id, @title, @abstract;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Concatenate the title and abstract to create the input text for embeddings
    SET @text = @title + ':' + @abstract;

    -- Generate the embedding for the session's title and abstract
    EXEC GET_EMBEDDINGS 'text-embedding-3-small', @text, @embedding OUTPUT;

    -- Update the embeddings column with the generated embedding
    UPDATE web.sessions
    SET embeddings = @embedding
    WHERE id = @session_id;

    -- Fetch the next session
    FETCH NEXT FROM session_cursor INTO @session_id, @title, @abstract;
END;

CLOSE session_cursor;
DEALLOCATE session_cursor;
--end of script

