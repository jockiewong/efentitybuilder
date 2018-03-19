﻿SELECT
	TABLE_NAME Name,
	TABLE_COMMENT Description
FROM
	information_schema.TABLES
WHERE
	table_schema = '@DATABASE';

SELECT
	TABLE_NAME,
	COLUMN_NAME,
	COLUMN_COMMENT,
	DATA_TYPE,	
	(CASE WHEN INSTR(COLUMN_KEY,'PRI')>0 THEN 1 else 0 END) IS_PRIMARY,
	(CASE WHEN IS_NULLABLE='YES' THEN 1 ELSE 0 END) NULLABLE,
	(CASE WHEN INSTR(EXTRA,'auto_increment')>0 THEN 1 else 0 END) IS_IDENTITY,
	CHARACTER_MAXIMUM_LENGTH
FROM
	information_schema.COLUMNS
WHERE
	TABLE_SCHEMA = '@DATABASE';

SELECT
	REFERENCED_TABLE_NAME,
	REFERENCED_COLUMN_NAME,
	TABLE_NAME,
	COLUMN_NAME
FROM
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
	table_schema = '@DATABASE' AND
	REFERENCED_COLUMN_NAME IS NOT NULL AND
	REFERENCED_TABLE_NAME  IS NOT NULL;