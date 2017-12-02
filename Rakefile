# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

if Rails.env.development?
  desc "Runs rubocop and scss-lint"
  task stylecheck: "stylecheck:default"

  namespace :stylecheck do
    desc "Runs rubocop and scss-lint"
    task default: [:ruby, :scss]

    desc "Runs rubocop"
    task :ruby do
      sh "rubocop ."
    end

    desc "Runs scss-lint"
    task :scss do
      sh "scss-lint app/assets/stylesheets"
    end
  end
end
