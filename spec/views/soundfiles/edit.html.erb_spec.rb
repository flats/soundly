require 'rails_helper'

RSpec.describe "soundfiles/edit", type: :view do
  before(:each) do
    @soundfile = assign(:soundfile, Soundfile.create!(
      :sound => nil,
      :file_name => "MyString",
      :content_type => "MyString",
      :file_size => 1
    ))
  end

  it "renders the edit soundfile form" do
    render

    assert_select "form[action=?][method=?]", soundfile_path(@soundfile), "post" do

      assert_select "input#soundfile_sound_id[name=?]", "soundfile[sound_id]"

      assert_select "input#soundfile_file_name[name=?]", "soundfile[file_name]"

      assert_select "input#soundfile_content_type[name=?]", "soundfile[content_type]"

      assert_select "input#soundfile_file_size[name=?]", "soundfile[file_size]"
    end
  end
end
