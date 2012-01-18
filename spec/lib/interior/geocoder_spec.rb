require 'spec_helper.rb'
require 'interior/geocoder.rb'

describe Interior::Geocoder do
  let(:coder) { Interior::Geocoder }

  describe '#get_lat_lon' do
    let (:st)     { 'AZ' }
    let (:me)     {  14  }
    let (:to)     {  1   }
    let (:to_dir) {  'N' }
    let (:ra)     {  1   }
    let (:ra_dir) {  'E' }
    let (:se)     {  35  }

    subject { coder.get_lat_lon(st, me, to, to_dir, ra, ra_dir, se) }

    context 'with section' do
      it 'returns successful response' do
        subject.success?.should == true
      end

      it 'response contains correct latitude' do
        subject.latitude.should  == 33.384549272498
      end

      it 'response contains correct longitude' do
        subject.longitude.should == -112.228362739723
      end
    end

    context 'without section' do
      let (:se) { nil }

      it 'returns successful response' do
        subject.success?.should == true
      end

      it 'response contains correct latitude' do
        subject.latitude.should  == 33.4211630233451
      end

      it 'response contains correct longitude' do
        subject.longitude.should == -112.254699834217
      end
    end

    context 'with invalid parameters' do
      let (:st) { 'INVALID' }

      it 'returns unsuccessful response' do
        subject.success?.should == false
      end

      it 'response contains nil for latitude' do
        subject.latitude.should  == nil
      end

      it 'response contains nil for longitude' do
        subject.longitude.should == nil
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
      Net::HTTP.stub(:get_response => double('response', :body => body))
      coder.send(:get_response_body, "AZ,14,1,0,N,1,0,E,0,,0")
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
