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


_register_new_user :: Connection -> String -> String -> String -> IO Integer
_register_new_user connection user_id name email = do

	let sql = "\
		\INSERT INTO T_USER(USER_ID, EMAIL, NAME, UPDATE_DATE, UPDATE_USER)\
		\VALUES(?, ?, ?, CURRENT_TIMESTAMP, ?)"
	stm <- prepare connection sql
	execute stm [toSql user_id, toSql email, toSql name, toSql "system"]

_generate_user_id :: IO String
_generate_user_id = do
	uuid <- nextRandom
	let random_uuid = toString uuid
	return random_uuid

main :: IO ()
main = do

	my_connection <- connectMySQL
		defaultMySQLConnectInfo {
			mysqlHost = "127.0.0.1",
			mysqlDatabase = "HASKELL_HDBC_TEST",
			mysqlUser = "root",
			mysqlPassword = "",
			mysqlUnixSocket = "/var/run/mysqld/mysqld.sock"
		}

	user_id <- _generate_user_id
	_register_new_user my_connection (user_id) ("" ++ user_id ++ "@gmail.com") "沢田研二"
	user_id <- _generate_user_id
	_register_new_user my_connection (user_id) ("" ++ user_id ++ "@gmail.com") "岸部一徳"
	user_id <- _generate_user_id
	_register_new_user my_connection (user_id) ("" ++ user_id ++ "@gmail.com") "加橋かつみ"
	user_id <- _generate_user_id
	_register_new_user my_connection (user_id) ("" ++ user_id ++ "@gmail.com") "森本太郎"
	user_id <- _generate_user_id
	_register_new_user my_connection (user_id) ("" ++ user_id ++ "@gmail.com") "岸部シロー"
	user_id <- _generate_user_id
	_register_new_user my_connection (user_id) ("" ++ user_id ++ "@gmail.com") "瞳みのる"

	commit my_connection

	disconnect my_connection

	putStrLn "Ok."
