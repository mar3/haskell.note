#!/usr/bin/env runghc
-- coding: utf-8
--
-- Haskell から MySQL を操作するはじめの一歩
--
--

import Database.HDBC
import Database.HDBC.MySQL
import Data.UUID
import Data.UUID.V1
--import Data.UUID.V3 as V3
import Data.UUID.V4
--import Data.UUID.V5 as V5

main = do

	my_connection <- connectMySQL
		defaultMySQLConnectInfo {
			mysqlHost = "127.0.0.1",
			mysqlDatabase = "HASKELL_HDBC_TEST",
			mysqlUser = "root",
			mysqlPassword = "",
			mysqlUnixSocket = "/var/run/mysqld/mysqld.sock"
		}

	--run my_connection "TRUNCATE TABLE T_USER" []

	my_statement <- prepare my_connection "INSERT INTO T_USER(USER_ID, EMAIL, NAME, UPDATE_DATE, UPDATE_USER) VALUES(?, ?, ?, CURRENT_TIMESTAMP, ?)"

	let system_user = "system"

	uuid <- nextRandom
	let uuid_string = toString uuid
	let email = "" ++ show uuid ++ "@gmail.com"
	execute my_statement [toSql uuid_string, toSql email, toSql "沢田研二", toSql system_user]

	uuid <- nextRandom
	let uuid_string = toString uuid
	let email = "" ++ show uuid ++ "@gmail.com"
	execute my_statement [toSql uuid_string, toSql email, toSql "岸部一徳", toSql system_user]

	uuid <- nextRandom
	let uuid_string = toString uuid
	let email = "" ++ show uuid ++ "@gmail.com"
	execute my_statement [toSql uuid_string, toSql email, toSql "加橋かつみ", toSql system_user]

	uuid <- nextRandom
	let uuid_string = toString uuid
	let email = "" ++ show uuid ++ "@gmail.com"
	execute my_statement [toSql uuid_string, toSql email, toSql "森本太郎", toSql system_user]

	uuid <- nextRandom
	let uuid_string = toString uuid
	let email = "" ++ show uuid ++ "@gmail.com"
	execute my_statement [toSql uuid_string, toSql email, toSql "岸部シロー", toSql system_user]

	uuid <- nextRandom
	let uuid_string = toString uuid
	let email = "" ++ show uuid ++ "@gmail.com"
	execute my_statement [toSql uuid_string, toSql email, toSql "瞳みのる", toSql system_user]

	commit my_connection

	disconnect my_connection

	putStrLn "Ok."
