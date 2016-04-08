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
			mysqlDatabase = "HASKELL_HDBC_TEST",
			mysqlUser = "root",
			mysqlPassword = "",
			mysqlUnixSocket = "/var/run/mysqld/mysqld.sock"
		}

	run my_connection "CREATE TABLE T_USER(USER_ID NVARCHAR(255) NOT NULL, NAME NVARCHAR(255) NOT NULL, EMAIL NVARCHAR(255), UPDATE_DATE TIMESTAMP NOT NULL, UPDATE_USER NVARCHAR(255) NOT NULL, PRIMARY KEY(USER_ID))" []

	disconnect my_connection

	putStrLn "Ok."
