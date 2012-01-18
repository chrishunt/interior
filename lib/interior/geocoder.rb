require 'net/http'
require 'cgi'
require 'nokogiri'
require 'interior/response'

module Interior
  class Geocoder
    API_DOMAIN = 'www.geocommunicator.gov'
    API_PATH   = 'TownshipGeocoder/TownshipGeocoder.asmx/GetLatLon'
    API_PARAM  = 'TRS'

    # st     : state
    # me     : meridian
    # to     : township
    # to_dir : township direction
    # ra     : range
    # ra_dir : range_direction
    # se     : section
    def self.get_lat_lon(st, me, to, to_dir, ra, ra_dir, se = nil)
      trs    = build_trs_param(st, me, to, to_dir, ra, ra_dir, se)
      xml    = get_response_body(trs)
      result = parse_xml(xml)
      result ? Interior::Response.new(result[:lat], result[:lon], true) : Interior::Response.new
    end

    private

    def self.build_trs_param(st, me, to, to_dir, ra, ra_dir, se = nil)
      "#{st},#{me},#{to},0,#{to_dir},#{ra},0,#{ra_dir},#{se ? se : 0},,0"
    end

    def self.get_response_body(trs)
      url = "http://#{API_DOMAIN}/#{API_PATH}?#{API_PARAM}=#{CGI::escape(trs.to_s)}"
      uri = URI.parse(url)
      Net::HTTP.get_response(uri).body
    end

    def self.parse_xml(xml)
      begin
        doc      = Nokogiri::XML(xml)
        data     = Nokogiri::XML(doc.children[0].children[5].text)
        points   = data.xpath('//georss:point').first.child.text.split
        lon, lat = points

        { :lat => lat.to_f, :lon => lon.to_f }
      rescue
        nil # if XML is the wrong format, return nil
      end
    end
  end
end
