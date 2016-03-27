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
	-- 切断
	-- ========================================================================
	disconnect my_connection

