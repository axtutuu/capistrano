# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, '{(1-1)}project_name'
set :repo_url, '{(1-2)path_to_git_url(ssh)}'
set :deploy_to, '{(1-3)path_to_railsapp}'

# SCMを指定
set :scm, :git
set :branch, 'master'

# logを詳細表示
set :format, :pretty
set :log_level, :debug

# ssh -tで実行
set :pty, true

# currentからsharedへsymlinkを貼るものを指定
set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}

#何個アプリを確保しておくか。この場合はデプロイした最新のアプリ5個をキープ
set :keep_releases, 5

# プラットフォーム gem ファイル対策
set :bundle_without, %w(development test ruby).join(" ")

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '{(1-4)ruby_version}'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :default_env, { path: "{(1-5)path_to_rbenv}" }

namespace :deploy do


  desc 'Restart application'
  task :restart do
    on roles(:app) do
      invoke 'unicorn:restart'
    end
  end

  # before :starting, :upload
  after :publishing, :restart

end
