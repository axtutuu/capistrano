# Capistrano Sample

## 環境
Nginx + Unicorn + Ruby on Rails + Aws


##環境設定

* 1 Gemのインストール

```
bundle install --path vendor/bundle
```

* 2 SSH接続設定

ローカルからAwsのサーバーへデプロイする想定で設定しています。

```
set :stage, :production
# production環境で動かしています。
set :rails_env, 'production'
# サーバーのIP と ユーザー名を指定
server '{(3-2)IP Adress}', user: '{(3-3)user name}',
roles: %w{web app db}

#ssh接続
set :ssh_options, {
　# pemファイルのディレクトリ指定
  keys: %w({(3-4)Path to pem fail}),
  forward_agent: true,
  auth_methods: %w(publickey)
}
```

* 3 gitの接続

git の接続URLは下記に設定
```
set :repo_url, '{(1-2)Path to git url(ssh)}'
```

* 4 デプロイ

下記のコマンドでssh接続されデプロイが開始
```
bundle exec cap relamark {(3-1)Project Name}
```
