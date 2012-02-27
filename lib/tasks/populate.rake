namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    [Story, Comment, User].each(&:delete_all)

    User.create({:email => "admin@test.ru", :name => "admin", :role => "admin", :password => "123", :password_confirmation => "123"})

  end
end
