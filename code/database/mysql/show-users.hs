#!/usr/bin/env runghc
-- coding: utf-8
--
-- Haskell から MySQL を操作するはじめの一歩
--
--

import Database.HDBC
import Database.HDBC.MySQL


main = do

	my_connection <- connectMySQL
		defaultMySQLConnectInfo {
			mysqlHost = "localhost",
			mysqlDatabase = "HASKELL_HDBC_TEST",
			mysqlUser = "root",
			mysqlPassword = "",
			mysqlUnixSocket = "/var/run/mysqld/mysqld.sock"
		}

	--run my_connection "CREATE DATABASE HASKELL_HDBC_TEST CHARACTER SET UTF8 COLLATE UTF8_BIN" []
	--run my_connection "CREATE TABLE T_USER(USER_ID NVARCHAR(255) NOT NULL, NAME NVARCHAR(255) NOT NULL, EMAIL NVARCHAR(255), UPDATE_DATE TIMESTAMP NOT NULL, UPDATE_USER NVARCHAR(255) NOT NULL, PRIMARY KEY(USER_ID))" []
	run my_connection "TRUNCATE TABLE T_USER" []
	my_statement <- prepare my_connection "INSERT INTO T_USER(USER_ID, EMAIL, NAME, UPDATE_DATE, UPDATE_USER) VALUES(?, ?, ?, CURRENT_TIMESTAMP, ?)"
	execute my_statement [toSql "2646c929-e3aa-4d5d-8d3c-40beab76fff1", toSql "2646c929-e3aa-4d5d-8d3c-40beab76fff1@gmail.com", toSql "沢田研二", toSql "system"]
	execute my_statement [toSql "02073cbc-03c6-4d2b-9f92-437c20f9ab58", toSql "02073cbc-03c6-4d2b-9f92-437c20f9ab58@gmail.com", toSql "岸部一徳", toSql "system"]
	execute my_statement [toSql "d727b452-5e13-42cc-94c1-cace76006962", toSql "d727b452-5e13-42cc-94c1-cace76006962@gmail.com", toSql "加橋かつみ", toSql "system"]
	execute my_statement [toSql "0245ae6b-6cb5-46b7-9372-6488ee8a0e3d", toSql "0245ae6b-6cb5-46b7-9372-6488ee8a0e3d@gmail.com", toSql "森本太郎", toSql "system"]
	execute my_statement [toSql "35a4af82-2b01-4b76-aca9-74df3d0c12a2", toSql "35a4af82-2b01-4b76-aca9-74df3d0c12a2@gmail.com", toSql "岸部シロー", toSql "system"]
	execute my_statement [toSql "caf8c82d-814a-43a9-928e-e821e0fb7ddb", toSql "caf8c82d-814a-43a9-928e-e821e0fb7ddb@gmail.com", toSql "瞳みのる", toSql "system"]
	commit my_connection

	-- ========================================================================
	-- 単純な SELECT
	-- ========================================================================
	my_result <- quickQuery my_connection "SELECT * FROM T_USER" []
	print $ my_result

	my_result <- quickQuery my_connection "SELECT * FROM T_USER WHERE USER_ID = ?" [toSql "--------"]
	print $ my_result

	-- ========================================================================
	-- バインド変数付き SELECT
	-- ========================================================================
	--my_statement <- prepare my_connection "SELECT * FROM T_USER WHERE 1 = ?"
	--execute my_statement [toSql 1]
	--row <- fetchRowAL my_statement
	--print $ row

	--CREATE TABLE TEST20160313(ID NVARCHAR(255) NOT NULL, NAME NVARCHAR(255), PRIMARY KEY(ID));
	--executeMany my_statement [[]]

	disconnect my_connection

	putStrLn "Ok."
