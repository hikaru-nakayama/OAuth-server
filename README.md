# Getting Started


### 準備
```
bundle ex rails db:create && bundle ex rails db:migrate
```

以下のテーブルが作成される。
```
+------------------------------------+
| Tables_in_oauth_server_development |
+------------------------------------+
| access_tokens                      |
| access_tokens_scopes               |
| authorization_code_scopes          |
| authorization_codes                |
| clients                            |
| scopes                             |
| users                              |
+------------------------------------+
```

clients table に client アプリの client id を uid に、client secret を secret に登録する。
```
+----+-------+--------+---------+---------------------------+----------------------------+----------------------------+
| id | name  | secret | uid     | redirect_uri              | created_at                 | updated_at                 |
+----+-------+--------+---------+---------------------------+----------------------------+----------------------------+
|  1 | myapp | aaaa   | bbbbbbb | http://myapp.com/callback | 2024-02-17 10:07:23.705787 | 2024-02-17 10:07:23.705787 |
+----+-------+--------+---------+---------------------------+----------------------------+----------------------------+
```


scopes table に client アプリのスコープを登録する。
```
+----+-------+----------------------------+----------------------------+
| id | name  | created_at                 | updated_at                 |
+----+-------+----------------------------+----------------------------+
|  1 | write | 2024-02-17 06:37:09.366813 | 2024-02-17 06:37:09.366813 |
|  2 | read  | 2024-02-17 06:37:14.574410 | 2024-02-17 06:37:14.574410 |
+----+-------+----------------------------+----------------------------+
```

users table に user の認証情報を登録する。
```
+----+--------------------------+-----------+----------------------------+----------------------------+
| id | login_id                 | password  | created_at                 | updated_at                 |
+----+--------------------------+-----------+----------------------------+----------------------------+
|  1 | testtest1234@example.com | testtest3 | 2024-02-17 11:06:53.123987 | 2024-02-17 11:06:53.123987 |
+----+--------------------------+-----------+----------------------------+----------------------------+
```

### 認可フロー
認可サーバーを起動する。
```
bundle ex rails s
```

次の URI にアクセスする。
```
localhost:3000/autholize?client_id=bbbbbbb&redirect_uri=http://myapp.com/callback&response_type=code&state=ccc&scope=read
````

この時、以下の画面が表示される。


users table に登録した認証情報を入力すると、redirect_uri にリダイレクトされ、URI に code が付与される。その code を用いて、以下のように access token を取得できる。

```
❯ curl http://localhost:3000/token \
  -d grant_type=authorization_code \
  -d code=wdGc2cl7 \
  -d client_id=bbbbbbb \
  -d redirect_uri=http://myapp.com/callback \
  -d client_secret=aaaa

```
