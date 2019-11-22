# to run:
# rake load_test:gen_users
# rake load_test:del_users

NUM_TSUNG_USERS = 100

namespace :load_test do
  desc "Create users Tsung 1-100"
  task gen_users: :environment do
    for test_id in 1..NUM_TSUNG_USERS do
      User.create!({
        :email => "tsung%d@dinner-pal.com" % [test_id],
        :password => 'password',
        :password_confirmation => 'password',
        :name => "Tsung %d" % [test_id]
      })
    end
  end

  desc "Destroy users Tsung 1-100"
  task del_users: :environment do
    for test_id in 1..NUM_TSUNG_USERS do
      User.destroy_by(name: "Tsung %d" % [test_id])
    end
  end

end
