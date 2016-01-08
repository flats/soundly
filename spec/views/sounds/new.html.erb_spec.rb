require 'rails_helper'

RSpec.describe "sounds/new", type: :view do
  before(:each) do
    assign(:sound, Sound.new(
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders new sound form" do
    render

    assert_select "form[action=?][method=?]", sounds_path, "post" do

      assert_select "input#sound_title[name=?]", "sound[title]"

      assert_select "input#sound_user_id[name=?]", "sound[user_id]"
    end
  end
end
