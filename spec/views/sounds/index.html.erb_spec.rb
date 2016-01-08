require 'rails_helper'

RSpec.describe "sounds/index", type: :view do
  before(:each) do
    assign(:sounds, [
      Sound.create!(
        :title => "Title",
        :user => nil
      ),
      Sound.create!(
        :title => "Title",
        :user => nil
      )
    ])
  end

  it "renders a list of sounds" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
