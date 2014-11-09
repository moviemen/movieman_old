require 'spec_helper'

describe "episodes/edit" do
  before(:each) do
    @episode = assign(:episode, stub_model(Episode,
      :name => "MyString",
      :url => "MyString",
      :last_season => 1,
      :last_episode => 1
    ))
  end

  it "renders the edit episode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", episode_path(@episode), "post" do
      assert_select "input#episode_name[name=?]", "episode[name]"
      assert_select "input#episode_url[name=?]", "episode[url]"
      assert_select "input#episode_last_season[name=?]", "episode[last_season]"
      assert_select "input#episode_last_episode[name=?]", "episode[last_episode]"
    end
  end
end
