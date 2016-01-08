require 'rails_helper'

RSpec.describe "sounds/edit", type: :view do
  before(:each) do
    @sound = assign(:sound, Sound.create!(
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders the edit sound form" do
    render

    assert_select "form[action=?][method=?]", sound_path(@sound), "post" do

      assert_select "input#sound_title[name=?]", "sound[title]"

      assert_select "input#sound_user_id[name=?]", "sound[user_id]"
    end
  end
end
