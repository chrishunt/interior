module Interior
  class Response
    attr_reader :latitude, :longitude

    def initialize(latitude = nil, longitude = nil, success = false)
      @latitude  = latitude
      @longitude = longitude
      @success   = success
    end

    def success?
      @success
    end
  end
end
