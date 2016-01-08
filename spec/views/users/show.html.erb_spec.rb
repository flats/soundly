require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "Username",
      :password_digest => "Password Digest",
      :real_name => "Real Name",
      :bio => "MyText",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Real Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image Url/)
  end
end
