#!/usr/bin/env runghc
-- coding: utf-8
--
-- Haskell から MySQL を操作するはじめの一歩
--
--

import Database.HDBC
import Database.HDBC.MySQL


main = do

	-- 接続
	my_connection <- connectMySQL
		defaultMySQLConnectInfo {
			mysqlHost = "localhost",
			mysqlDatabase = "HASKELL_HDBC_TEST",
			mysqlUser = "root",
			mysqlPassword = "",
			mysqlUnixSocket = "/var/run/mysqld/mysqld.sock"
		}

	-- ドライバや接続についての情報を表示します。
	print $ hdbcDriverName my_connection
	print $ hdbcClientVer my_connection
	print $ dbTransactionSupport my_connection

	-- 切断
	disconnect my_connection

