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
			mysqlHost = "127.0.0.1",
			mysqlDatabase = "INFORMATION_SCHEMA",
			mysqlUser = "root",
			mysqlPassword = "",
			mysqlUnixSocket = "/var/run/mysqld/mysqld.sock"
		}

	run my_connection "DROP DATABASE HASKELL_HDBC_TEST" []

	disconnect my_connection

	putStrLn "Ok."
