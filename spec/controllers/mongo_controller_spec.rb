require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "MongoController" do
  before do
    get "/"
  end

  it "returns hello world" do
    last_response.body.should == "Hello World"
  end
end
