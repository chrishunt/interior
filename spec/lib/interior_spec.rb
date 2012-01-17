require 'spec_helper.rb'
require 'interior.rb'

describe Interior::Geocoder do
  before :all do
    @coder = Interior::Geocoder
  end

  describe '#get_lat_lon' do
    subject do
      @coder.get_lat_lon(st, me, to, to_dir, ra, ra_dir, se)
    end

    let (:st)     { nil }
    let (:me)     { nil }
    let (:to)     { nil }
    let (:to_dir) { nil }
    let (:ra)     { nil }
    let (:ra_dir) { nil }
    let (:se)     { nil }

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

    context 'when in Arizona' do
      let (:st)     { 'AZ' }
      let (:me)     {  14  }
      let (:to)     {  1   }
      let (:to_dir) {  'N' }
      let (:ra)     {  1   }
      let (:ra_dir) {  'E' }
      let (:se)     {  35  }

      it 'returns correct latitude and longitude for Arizona' do
        subject.should == { :lat => 33.384549272498, :lon => -112.228362739723 }
      end
    end

    context 'when in Colorado' do
      let (:st)     { 'CO' }
      let (:me)     {  6   }
      let (:to)     {  1   }
      let (:to_dir) {  'S' }
      let (:ra)     {  68  }
      let (:ra_dir) {  'W' }
      let (:se)     {  16  }

      it 'returns correct latitude and longitude for Colorado' do
        subject.should == { :lat => 39.9648046692517 , :lon => -105.006276849858 }
      end
    end
  end

  describe '#build_trs_param' do
    subject do
      @coder.send(:build_trs_param, st, me, to, to_dir, ra, ra_dir, se)
    end

    context 'when in Arizona' do
      let (:st)     { 'AZ' }
      let (:me)     {  14  }
      let (:to)     {  1   }
      let (:to_dir) {  'N' }
      let (:ra)     {  1   }
      let (:ra_dir) {  'E' }
      let (:se)     {  35  }

      it 'returns the correct trs param' do
        subject.should == "AZ,14,1,0,N,1,0,E,35,,0"
      end
    end

    context 'when in Colorado' do
      let (:st)     { 'CO' }
      let (:me)     {  06  }
      let (:to)     {  1   }
      let (:to_dir) {  'S' }
      let (:ra)     {  68  }
      let (:ra_dir) {  'W' }
      let (:se)     {  16  }

      it 'returns the correct trs param' do
        subject.should == "CO,6,1,0,S,68,0,W,16,,0"
      end
    end

    context 'when missing section' do
      let (:st)     { 'AZ' }
      let (:me)     {  14  }
      let (:to)     {  1   }
      let (:to_dir) {  'N' }
      let (:ra)     {  1   }
      let (:ra_dir) {  'E' }
      let (:se)     {  nil }

      it 'defaults to section 0' do
        subject.should == "AZ,14,1,0,N,1,0,E,0,,0"
      end
    end
  end

  describe '#get_xml_body' do
    let(:trs) { "AZ,14,1,0,N,1,0,E,0,,0" }

    subject do
      response = double('response', :body => body)
      Net::HTTP.stub(:get_response => response)
      @coder.send(:get_xml_body, trs)
    end

    context 'when the response contains a body' do
      let(:body) { 'xml_body' }

      it 'returns the body' do
        subject.should == 'xml_body'
      end
    end

    context 'when the response does not contain a body' do
      let(:body) { nil }

      it 'returns nil' do
        subject.should == nil
      end
    end
  end
end
