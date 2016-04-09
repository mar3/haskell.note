#!/usr/bin/env runghc
-- coding: utf-8
--
-- Haskell から MySQL を操作するはじめの一歩
--
--

import Database.HDBC
import Database.HDBC.MySQL
import Data.Maybe




--convRow :: Maybe [SqlValue] -> String
convRow [sqlId, sqlDesc] = do
	show intid ++ ": " ++ desc
	where
		intid = (fromSql sqlId)::Integer
		desc = case fromSql sqlDesc of
			Just x -> x
			Nothing -> "NULL"

--convRow Nothing = "Nothing"

convRow x = do
	fail "Unexpected result: " ++ show x

--_print_rows stm -> do
	--let row = fetchRowAL stm

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
	-- パラメータなしの簡単な SELECT
	-- ========================================================================
	--my_result <- quickQuery my_connection "SELECT * FROM T_USER" []
	--mapM_ print my_result
	
	-- ========================================================================
	-- バインド変数付き SELECT
	-- ========================================================================
	--my_result <- quickQuery my_connection "SELECT * FROM T_USER WHERE USER_ID = ?" [toSql ("xxxxxxxxxxxxxx")]
	--mapM_ print my_result

	-- ========================================================================
	-- バインド変数付き SELECT
	-- ========================================================================
	my_statement <- prepare my_connection "SELECT * FROM T_USER WHERE '1' = ?"
	execute my_statement [toSql (1::Int)]
	--row <- fetchRowAL my_statement
	--row <- fetchRowMap my_statement

	--_print_rows my_statement
	row <- fetchRow my_statement
	print $ row

	disconnect my_connection

	putStrLn "Ok."

