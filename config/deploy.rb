
set :application, 'movieman'
application = fetch(:application)
set :repo_url, 'git@github.com:moviemen/movieman.git'
set :deploy_to, "/home/dev/#{application}"


set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', "#{release_path}/tmp"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :symlink_shared do
    on roles(:app), in: :sequence, wait: 5 do
      execute "ln -s #{shared_path}/database.yml #{release_path}/config/"
      execute "ln -s #{shared_path}/secrets.yml #{release_path}/config/"
    end
  end


  after :finishing, 'deploy:cleanup'
end

before 'deploy:assets:precompile', 'deploy:symlink_shared'
after 'deploy', 'deploy:restart'
