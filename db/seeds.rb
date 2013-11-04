require 'faker'
require 'database_cleaner'

# Noddy class to help us build some seed data.
class SesameSeeder

  def run
    clean_database
    teams = seed_teams
  end

  def clean_database
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  def seed_teams
    (1..11).map do |i|
      Team.create!(name: "Team #{Faker::Company.catch_phrase}", 
                   email: Faker::Internet.email)                 
    end
  end

end

SesameSeeder.new().run









