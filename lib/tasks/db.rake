namespace :db do
  desc "Load example data from db/examples.rb"
  task examples: :environment do
    require_relative '../../db/examples'
  end
end
