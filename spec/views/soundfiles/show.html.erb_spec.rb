require 'rails_helper'

RSpec.describe "soundfiles/show", type: :view do
  before(:each) do
    @soundfile = assign(:soundfile, Soundfile.create!(
      :sound => nil,
      :file_name => "File Name",
      :content_type => "Content Type",
      :file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/File Name/)
    expect(rendered).to match(/Content Type/)
    expect(rendered).to match(/1/)
  end
end
