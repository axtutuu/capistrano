set :stage, :production
set :rails_env, 'production'
server '52.68.145.131', user: 'kawasaki',
roles: %w{web app db}  #何サーバーの処理を書くか。今回は同じサーバーで全部動かすのでweb app db全て指定

#sshでEC２に入るのに必要
set :ssh_options, {
  keys: %w(~/pem/relamark.pem),
  # keys: %w(/Users/kasaiyousuke/pem/rejob_aws_appuser.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}
