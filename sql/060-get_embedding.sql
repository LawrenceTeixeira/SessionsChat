/****** Object:  StoredProcedure [dbo].[GET_EMBEDDINGS]    Script Date: 10/6/2024 6:28:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GET_EMBEDDINGS]
(
    @model VARCHAR(MAX),
    @text NVARCHAR(MAX),
    @embedding VARBINARY(8000) OUTPUT
)
AS
BEGIN
    DECLARE @retval INT, @response NVARCHAR(MAX);
    DECLARE @url VARCHAR(MAX);
    DECLARE @payload NVARCHAR(MAX) = JSON_OBJECT('input': @text);

    -- Set the @url variable with proper concatenation before the EXEC statement
    SET @url = 'https://<YOUR ENDPOINT>.openai.azure.com/openai/deployments/' + @model + '/embeddings?api-version=2023-05-15';

    EXEC dbo.sp_invoke_external_rest_endpoint 
        @url = @url,
        @method = 'POST',   
        @payload = @payload,   
        @headers = '{"Content-Type":"application/json", "api-key":"YOU AZURE OPEN AI KEY"}', 
        @response = @response OUTPUT;

    -- Use JSON_QUERY to extract the embedding array directly
    DECLARE @jsonArray NVARCHAR(MAX) = JSON_QUERY(@response, '$.result.data[0].embedding');

    
    SET @embedding = JSON_ARRAY_TO_VECTOR(@jsonArray);
END
