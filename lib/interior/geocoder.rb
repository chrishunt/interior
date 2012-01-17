# For detailed documentation on web service API:
#   http://goo.gl/rdhsu
#
# Example:
#   AZ,14,1,0,N,1,0,E,35,,0
#   CO,06,001,0,S,068,0,W,016,,0
#
# 1  State (CO, UT, WY)
# 2  Principal Meridian
# 3  Township
# 4  Township Fraction (0)
# 5  Township Direction (N, S)
# 6  Range
# 7  Range Fraction (0)
# 8  Range Direction (W, E)
# 9  Section (0 for none)
# 10 Section Division (Optional)
# 11 Township Duplicate

# Meridian Map:
#   http://goo.gl/a0Bz6
#
# Meridian Codes:
#
# AL  16  HUNTSVILLE MER
# AL  25  ST. STEPHENS MER
# AL  29  TALLAHASEE MER
# AR  05  5TH PM
# AZ  14  GILA-SALT RIVER MER
# AZ  22  NAVAJO MER
# AZ  27  SAN BERNARDINO MER
# CA  14  GILA-SALT RIVER MER
# CA  15  HUMBOLDT MER
# CA  21  MOUNT DIABLO MER
# CA  27  SAN BERNARDINO MER
# CO  06  6TH PM
# CO  23  NEW MEX PM
# CO  31  UTE MER
# CT  CT  CONNECTICUT
# DE  DE  DELAWARE
# FL  29  TALLAHASEE MER
# GA  GA  GEORGIA
# IA  05  5TH PM
# ID  08  BOISE MER
# IL  02  2ND PM
# IL  03  3RD PM
# IL  04  4TH PM ILLINOIS
# IN  01  1ST PM
# IN  02  2ND PM
# KS  06  6TH PM
# KY  KY  KENTUCKY
# LA  18  LOUISIANA MER
# LA  24  ST. HELENA MER
# MA  MA  MASSACHUSETS
# MD  MD  MARYLAND
# ME  ME  MAINE
# MI  19  MICHIGAN MER
# MN  05  5TH PM
# MN  46  4TH PM MN-WI
# MO  05  5TH PM
# MS  09  CHICKASAW MER
# MS  10  CHOCTAW MER
# MS  16  HUNTSVILLE MER
# MS  25  ST. STEPHENS MER
# MS  32  WASHINGTON MER
# MT  20  "PRIN MER, MT"
# NC  NC  NO CAROLINA
# ND  05  5TH PM
# NE  06  6TH PM
# NH  NH  NEW HAMPSHIRE
# NJ  NJ  NEW JERSEY
# NM  23  NEW MEX PM
# NV  21  MOUNT DIABLO MER
# NV  27  SAN BERNARDINO MER
# NY  NY  NEW YORK
# OH  01  1ST PM
# OH  19  MICHIGAN MER
# OH  35  OHIO RIVER SURVEY
# OH  36  BETWEEN THE MIAMIS
# OH  37  MUSKINGUM RIVER BASIN
# OH  38  OHIO RIVER BASIN
# OH  39  1ST SCIOTO RIVER BASE
# OH  40  2ND SCIOTO RIVER BASE
# OH  41  3RD SCIOTO RIVER BASE
# OH  43  TWELVE MILE SQUARE
# OH  47  WEST OF GREAT MIAMI
# OH  48  US MILITARY SURVEY
# OH  91  CT WEST RES-OHIO
# OH  92  OHIO CO PUR-OHIO
# OH  93  VA MILITARY SURVEY-OHIO
# OH  OH  OHIO
# OK  11  CIMARRON MER
# OK  17  INDIAN MER
# OR  33  WILLAMETTE MER
# PA  PA  PENNSYLVANIA
# RI  RI  RHODE ISLAND
# SC  SC  SO CAROLINA
# SD  05  5TH PM
# SD  06  6TH PM
# SD  07  BLACK HILLS MER
# TN  TN  TENNESSEE
# TX  TX  TEXAS
# UT  26  SALT LAKE MER
# UT  30  UINTAH SPEC MER
# VA  VA  VIRGINIA
# VT  VT  VERMONT
# WA  33  WILLAMETTE MER
# WI  46  4TH PM MN-WI
# WV  WV  WEST VIRGINIA
# WY  06  6TH PM
# WY  34  WIND RIVER MER

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
    def self.get_lat_lon(st, me, to, to_dir, ra, ra_dir, se)
      trs = build_trs_param(st, me, to, to_dir, ra, ra_dir, se)
      xml = get_response_body(trs)
      result = parse_xml(xml)
      result ? Interior::Response.new(result[:lat], result[:lon]) : nil
    end

    private

    def self.build_trs_param(st, me, to, to_dir, ra, ra_dir, se = nil)
      "#{st},#{me},#{to},0,#{to_dir},#{ra},0,#{ra_dir},#{se ? se : 0},,0"
    end

    def self.get_response_body(trs)
      uri = URI.parse("http://#{API_DOMAIN}/#{API_PATH}?#{API_PARAM}=#{CGI::escape(trs.to_s)}")
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
