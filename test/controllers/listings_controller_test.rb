require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest

  include Warden::Test::Helpers

  setup do
    @listing = listings(:one)
    @user = users(:one)
    @user.confirmed_at = Time.now
    @user.save
    login_as(@user, :scope => :user)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should search listings" do
    get browse_url, params: { query: 'MyText' }
    assert_response :success
    assert_select "tbody" do
      assert_select "tr", 2
    end
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { chef_id: @listing.chef_id, description: @listing.description, location: @listing.location, title: @listing.title } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { chef_id: @listing.chef_id, description: @listing.description, location: @listing.location, title: @listing.title } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
