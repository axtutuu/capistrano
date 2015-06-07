set :stage, :production
set :rails_env, 'production'
server '{(3-2)IP Adress}', user: '{(3-3)user name}',
roles: %w{web app db}  #何サーバーの処理を書くか。今回は同じサーバーで全部動かすのでweb app db全て指定

#sshでEC２に入るのに必要
set :ssh_options, {
  keys: %w({(3-4)Path to pem file}),
  forward_agent: true,
  auth_methods: %w(publickey)
}
