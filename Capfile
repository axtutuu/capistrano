# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Bundler and Rails
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'

# rbenv
require 'capistrano/rbenv'
set :rbenv_type, :user # or :system
set :rbenv_ruby, '2.1.2'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
