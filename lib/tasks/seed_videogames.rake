namespace :db do
  namespace :seed do
    desc "Load the videogames'"
    task :videogames => :environment do
      load Rails.root.join('db', 'seeds', 'videogames.rb')
    end
  end
end