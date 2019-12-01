# to run:
# rake load_test:gen_users
# rake load_test:del_users
# rake load_test:gen_listings
# rake load_test:del_listings

NUM_TSUNG_USERS = 100
NUM_TSUNG_LISTINGS = 100

namespace :load_test do
  desc "Create users Tsung 1-NUM_TSUNG_USERS"
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

  desc "Destroy users Tsung 1-NUM_TSUNG_USERS"
  task del_users: :environment do
    for test_id in 1..NUM_TSUNG_USERS do
      User.destroy_by(name: "Tsung %d" % [test_id])
    end
  end

  desc "Create listings Tsung Listing 1-NUM_TSUNG_LISTINGS"
  task gen_listings: :environment do
    for test_id in 1..NUM_TSUNG_LISTINGS do
      # If the user with this id doesn't exist, create one
      unless User.find(test_id) do
        u = User.create!({
          :email => "tsunglistingtestuser%d@dinner-pal.com" % [test_id],
          :password => 'password',
          :password_confirmation => 'password',
          :name => "Tsung listing test user with id %d" % [test_id]
        })
        u.id = test_id
        u.save!
      end
      Listing.create!({
        :title => "Tsung Listing %d" % [test_id],
        :description => 'Description of this Tsung Listing. This belongs to chef with id %d' % [test_id],
        :chef_id => test_id,
        :location => "Vincent's house"
      })
    end
  end

  desc "Destroy listings Tsung Listing 1-NUM_TSUNG_LISTINGS"
  task del_listings: :environment do
    for test_id in 1..NUM_TSUNG_LISTINGS do
      Listing.destroy_by(name: "Tsung Listing %d" % [test_id])
      User.destroy_by(name: "Tsung listing test user with id %d" % [test_id])
    end
  end
end
