require 'spec_helper.rb'
require 'interior/response.rb'

describe Interior::Response do
  let(:latitude)  { 30 }
  let(:longitude) { 60 }
  let(:success)   { true }
  let(:response)  { Interior::Response.new(latitude, longitude, success) }

  describe('#success?') do
    it 'defaults to false' do
      Interior::Response.new.success?.should == false
    end

    it 'can be initialized' do
      response.success?.should == true
    end

    it 'is readonly' do
      lambda { response.success = false }.should raise_error
    end

  end

  describe('#latitude') do
    it 'can be initialized' do
      response.latitude.should == latitude
    end

    it 'is readonly' do
      lambda { response.latitude = 100 }.should raise_error
    end
  end

  describe('#longitude') do
    it 'can be initialized' do
      response.longitude.should == longitude
    end

    it 'is readonly' do
      lambda { response.longitude = 100 }.should raise_error
    end
  end
end
