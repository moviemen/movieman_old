require 'spec_helper'

describe "episodes/index" do
  before(:each) do
    assign(:episodes, [
      stub_model(Episode,
        :name => "Name",
        :url => "Url",
        :last_season => 1,
        :last_episode => 2
      ),
      stub_model(Episode,
        :name => "Name",
        :url => "Url",
        :last_season => 1,
        :last_episode => 2
      )
    ])
  end

  it "renders a list of episodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end