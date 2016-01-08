require 'rails_helper'

RSpec.describe "soundfiles/new", type: :view do
  before(:each) do
    assign(:soundfile, Soundfile.new(
      :sound => nil,
      :file_name => "MyString",
      :content_type => "MyString",
      :file_size => 1
    ))
  end

  it "renders new soundfile form" do
    render

    assert_select "form[action=?][method=?]", soundfiles_path, "post" do

      assert_select "input#soundfile_sound_id[name=?]", "soundfile[sound_id]"

      assert_select "input#soundfile_file_name[name=?]", "soundfile[file_name]"

      assert_select "input#soundfile_content_type[name=?]", "soundfile[content_type]"

      assert_select "input#soundfile_file_size[name=?]", "soundfile[file_size]"
    end
  end
end
