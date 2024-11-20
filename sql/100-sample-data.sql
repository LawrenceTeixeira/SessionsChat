-- Insert sessions into [web].[sessions]
INSERT INTO [web].[sessions] ([title], [abstract], [external_id], [start_time], [end_time])
VALUES
    ('Wrapping Azure Open AI, AI Search & Cosmos DB into an Azure Function', 'In this session, we will explore how to seamlessly integrate Azure OpenAI, AI Search, and Cosmos DB into a single, efficient Azure Function...', 'session_001', '2024-10-25T04:00:00', '2024-10-25T05:00:00'),
    ('Using Power BI to bridge the machine learning adoption gap in healthcare', '', 'session_002', '2024-10-25T05:15:00', '2024-10-25T06:15:00'),
    ('Serving delta tables via API', '', 'session_003', '2024-10-25T05:15:00', '2024-10-25T06:15:00'),
    ('Migration-Path for Admins: From Synapse to Fabric with Metadata-Driven and Automatic Deployment', '', 'session_004', '2024-10-25T06:30:00', '2024-10-25T07:30:00'),
    ('Efficiently communicating with API’s using a Fabric Notebook', '', 'session_005', '2024-10-25T06:30:00', '2024-10-25T07:30:00'),
    ('PowerQuery: Incremental web connection load', '', 'session_006', '2024-10-25T08:00:00', '2024-10-25T09:00:00'),
    ('Fabric through the eyes of a Power BI pro', '', 'session_007', '2024-10-25T08:00:00', '2024-10-25T09:00:00'),
    ('Navigating Vector Operations in Azure SQL for Better Data Insights: A Guide How to Use Generative AI', '', 'session_008', '2024-10-25T09:15:00', '2024-10-25T10:15:00'),
    ('End To End Implementation Planning of Microsoft Fabric', '', 'session_009', '2024-10-25T09:15:00', '2024-10-25T10:15:00'),
    ('Adapting Medallion Architecture to Meet Your Data Needs', '', 'session_010', '2024-10-25T10:45:00', '2024-10-25T11:45:00'),
    ('Strategic Workplace Side Projects for Career Advancement: DORA Metrics with Microsoft Products', '', 'session_011', '2024-10-25T10:45:00', '2024-10-25T11:45:00'),
    ('Smooth Sailing to the Azure Cloud: A Guided Flight of PaaS Offerings', '', 'session_012', '2024-10-25T12:00:00', '2024-10-25T13:00:00'),
    ('First Steps to Understanding Data Mining', '', 'session_013', '2024-10-25T12:00:00', '2024-10-25T13:00:00');

-- Insert speakers into [web].[speakers]
INSERT INTO [web].[speakers] ([full_name], [external_id])
VALUES
    ('Chris Durow', 'speaker_001'),
    ('Andrew Cushing', 'speaker_002'),
    ('Atte Sukari', 'speaker_003'),
    ('Benedict Albrecht', 'speaker_004'),
    ('Yor Braakman', 'speaker_005'),
    ('Nacho Cardenal', 'speaker_006'),
    ('Anne Holst-Dyrnes', 'speaker_007'),
    ('Lawrence Teixeira', 'speaker_008'),
    ('Matt Edington', 'speaker_009'),
    ('Stephen Burgess', 'speaker_010'),
    ('Marta Vila Garrido', 'speaker_011'),
    ('Yuki Hata', 'speaker_012'),
    ('Chloe Zacharias', 'speaker_013');

-- Insert session-speaker relationships into [web].[sessions_speakers]
INSERT INTO [web].[sessions_speakers] ([session_id], [speaker_id])
VALUES
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_001'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_001')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_002'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_002')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_003'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_003')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_004'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_004')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_005'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_005')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_006'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_006')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_007'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_007')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_008'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_008')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_009'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_009')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_010'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_010')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_011'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_011')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_012'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_012')),
    ((SELECT [id] FROM [web].[sessions] WHERE [external_id] = 'session_013'), (SELECT [id] FROM [web].[speakers] WHERE [external_id] = 'speaker_013'));
