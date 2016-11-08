require 'spec_helper'

describe Scanii do
  it 'has a version number' do
    expect(Scanii::VERSION).not_to be nil
  end

end

describe Scanii::Base do

  it "should raise an error if the api_key has not been set" do
    expect do
      Scanii.new
    end.to raise_error ArgumentError
  end


  describe "Scanii.new" do
    it "Scanii() method should return a new Scanii object" do
      mailgun = Scanii.new({api_key: "api-key-xxxxxxxxxxxxxxxxx", api_secret: "api-secret-xxxxxxxxxxxxxxxxx"})
      mailgun.should be_kind_of(Scanii::Base)
    end
  end



  describe "configuration" do

    describe "setting configurations" do
      before(:each) do
        Scanii.configure do |c|
          c.api_key = 'some-api-key'
          c.api_secret = 'some-api-key'
        end
      end

      it "allows me to set my API key easily" do
        Scanii.api_key.should eql 'some-api-key'
      end

    end
  end
end