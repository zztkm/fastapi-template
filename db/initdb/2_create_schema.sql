-- https://zenn.dev/re24_1986/articles/b76c3fd8f76aec

-- DB 切り替え
\c maindb

-- ユーザー用スキーマ作成
create schema app_user;

grant all privileges on schema app_user to app_user;
