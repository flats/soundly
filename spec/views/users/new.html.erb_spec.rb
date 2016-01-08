require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :username => "MyString",
      :password_digest => "MyString",
      :real_name => "MyString",
      :bio => "MyText",
      :image_url => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_real_name[name=?]", "user[real_name]"

      assert_select "textarea#user_bio[name=?]", "user[bio]"

      assert_select "input#user_image_url[name=?]", "user[image_url]"
    end
  end
end
