require 'rails_helper'

RSpec.describe "soundfiles/index", type: :view do
  before(:each) do
    assign(:soundfiles, [
      Soundfile.create!(
        :sound => nil,
        :file_name => "File Name",
        :content_type => "Content Type",
        :file_size => 1
      ),
      Soundfile.create!(
        :sound => nil,
        :file_name => "File Name",
        :content_type => "Content Type",
        :file_size => 1
      )
    ])
  end

  it "renders a list of soundfiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
