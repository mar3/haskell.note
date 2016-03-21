#!/usr/bin/env runghc
-- coding: utf-8
--
-- Haskell から MySQL を操作するはじめの一歩
--
--
--
-- mysql> CREATE DATABASE HASKELL_HDBC_TEST CHARACTER SET UTF8 COLLATE UTF8_BIN;
--
--
--
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

	-- ========================================================================
	-- ドライバや接続についての情報を表示します。
	-- ========================================================================
	print $ hdbcDriverName my_connection
	print $ hdbcClientVer my_connection
	print $ dbTransactionSupport my_connection

	-- ========================================================================
	-- 表の一覧を表示します。
	-- ========================================================================
	my_tables <- getTables my_connection
	print $ my_tables

	-- ========================================================================
	-- 単純な SELECT
	-- ========================================================================
	my_result <- quickQuery my_connection "SELECT 'ABC'" []
	print $ my_result

	-- ========================================================================
	-- バインド変数付き SELECT
	-- ========================================================================
	--my_statement <- prepare my_connection "SELECT 'Real Worl Haskell!!' WHERE 1 = ?"
	--execute my_statement [toSql 1]
	--row <- fetchRowAL my_statement
	--print $ row

	--my_statement <- prepare my_connection "SELECT 'Real Worl Haskell!!' WHERE 1 = ?"
	----affected <- execute my_statement [[toSql 1]]
	--affected <- run my_statement [[toSql 1]]
	--print $ affected

	-- ========================================================================
	--
	-- ========================================================================
	--CREATE TABLE TEST20160313(ID NVARCHAR(255) NOT NULL, NAME NVARCHAR(255), PRIMARY KEY(ID));
	--executeMany my_statement [[]]

	-- ========================================================================
	-- 切断
	-- ========================================================================
	disconnect my_connection

	putStrLn "Ok."
