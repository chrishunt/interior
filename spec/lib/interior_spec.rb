require 'spec_helper.rb'

describe Interior::Geocoder do
  before(:all) do
    @coder = Interior::Geocoder
  end

  describe '#get_lat_lon' do
    it 'returns a hash' do
      @coder.get_lat_lon(nil, nil, nil, nil).class.should == Hash
    end

    it 'returns a collection of size 2' do
      @coder.get_lat_lon(nil, nil, nil, nil).size.should == 2
    end

    it 'returns collection with key :lat' do
      @coder.get_lat_lon(nil, nil, nil, nil).keys.include?(:lat).should == true
    end

    it 'returns collection with key :lon' do
      @coder.get_lat_lon(nil, nil, nil, nil).keys.include?(:lon).should == true
    end

    it 'returns float values' do
      result = @coder.get_lat_lon(nil, nil, nil, nil)
      result.values.each { |v| v.class.should == Float }
    end

    it 'returns latitude between -90 and 90' do
      result = @coder.get_lat_lon(14, '1N', '1E', 35)
      (result[:lat] >= -90).should == true
      (result[:lat] <=  90).should == true
    end

    it 'returns longitude between -180 and 180' do
      result = @coder.get_lat_lon(14, '1N', '1E', 35)
      (result[:lon] >= -180).should == true
      (result[:lon] <=  180).should == true
    end

    it 'correctly maps meridian, township, range, section to lat, lon' do
      @coder.get_lat_lon(14, '1N', '1E', 35).should == {
        :lat => 33.384549272498, :lon => -112.228362739723
      }
    end
  end
end
