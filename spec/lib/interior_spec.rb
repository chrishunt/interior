require 'spec_helper.rb'

describe Interior::Geocoder do
  before(:all) do
    @coder = Interior::Geocoder
  end

  describe '#get_lat_lon' do
    subject do
      @coder.get_lat_lon(state, meridian, township, range, section)
    end

    let(:state)    { nil }
    let(:meridian) { nil }
    let(:township) { nil }
    let(:range)    { nil }
    let(:section)  { nil }

    it 'returns a hash' do
      subject.class.should == Hash
    end

    it 'returns a collection of size 2' do
      subject.size.should == 2
    end

    it 'returns collection with key :lat' do
      subject.keys.include?(:lat).should == true
    end

    it 'returns collection with key :lon' do
      subject.keys.include?(:lon).should == true
    end

    it 'returns float values' do
      subject.values.each { |v| v.class.should == Float }
    end

    context('when in Arizona') do
      let(:state)    { 'AZ' }
      let(:meridian) {  14  }
      let(:township) { '1N' }
      let(:range)    { '1E' }
      let(:section)  {  35  }

      it 'returns correct latitude and longitude for Arizona' do
        subject.should == { :lat => 33.384549272498, :lon => -112.228362739723 }
      end
    end

    context('when in Colorado') do
      let(:state)    { 'CO'  }
      let(:meridian) {  6    }
      let(:township) { '1S'  }
      let(:range)    { '68W' }
      let(:section)  {  16   }

      it 'returns correct latitude and longitude for Colorado' do
        subject.should == { :lat => 39.9648046692517 , :lon => -105.006276849858 }
      end
    end
  end
end
