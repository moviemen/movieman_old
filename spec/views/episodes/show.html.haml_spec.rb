require 'spec_helper'

describe "episodes/show" do
  before(:each) do
    @episode = assign(:episode, stub_model(Episode,
      :name => "Name",
      :url => "Url",
      :last_season => 1,
      :last_episode => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
