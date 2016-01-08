require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :real_name => "Real Name",
        :bio => "MyText",
        :image_url => "Image Url"
      ),
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :real_name => "Real Name",
        :bio => "MyText",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Real Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end
