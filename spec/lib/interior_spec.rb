require 'spec_helper.rb'
require 'interior.rb'

describe Interior::Geocoder do
  let(:coder) { Interior::Geocoder }

  describe '#get_lat_lon' do
    subject { coder.get_lat_lon(st, me, to, to_dir, ra, ra_dir, se) }

    context 'when in Arizona' do
      let (:st)     { 'AZ' }
      let (:me)     {  14  }
      let (:to)     {  1   }
      let (:to_dir) {  'N' }
      let (:ra)     {  1   }
      let (:ra_dir) {  'E' }
      let (:se)     {  35  }

      it 'returns correct latitude and longitude' do
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

      it 'returns correct latitude and longitude' do
        subject.should == { :lat => 39.9648046692517 , :lon => -105.006276849858 }
      end
    end
  end

  describe '#build_trs_param' do
    subject { coder.send(:build_trs_param, st, me, to, to_dir, ra, ra_dir, se) }

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

  describe '#get_response_body' do
    subject do
      trs = "AZ,14,1,0,N,1,0,E,0,,0"
      response = double('response', :body => body)
      Net::HTTP.stub(:get_response => response)
      coder.send(:get_response_body, trs)
    end

    context 'when the response contains a body' do
      let(:body) { 'response_body' }

      it 'returns the body' do
        subject.should == 'response_body'
      end
    end

    context 'when the response does not contain a body' do
      let(:body) { nil }

      it 'returns nil' do
        subject.should == nil
      end
    end
  end

  describe '#parse_xml' do
    subject { coder.send(:parse_xml, xml) }

    context 'when in Arizona' do
      let(:xml) { File.open('spec/fixtures/az.xml').read }

      it 'returns the correct latitude and longitude' do
        subject.should == { :lat => 33.384549272498, :lon => -112.228362739723 }
      end
    end

    context 'when in Colorado' do
      let(:xml) { File.open('spec/fixtures/co.xml').read }

      it 'returns the correct latitude and longitude' do
        subject.should == { :lat => 39.9648046692517, :lon => -105.006276849858 }
      end
    end

    context 'when no xml is provided' do
      let(:xml) { nil }

      it 'returns nil' do
        subject.should == nil
      end
    end
  end
end
