#!/usr/bin/env bash

for f in ./databases/schemas/*; do
	name=`basename -s .sql $f`
	sqlite3 -init $f ./databases/$name.db .quit
done

sqlite3 ./databases/chat-plugins.db ".read ./databases/migrations/chat-plugins/v7.sql"
sqlite3 ./databases/stored-battles.db ".read ./databases/migrations/storedbattles/v2.sql"
