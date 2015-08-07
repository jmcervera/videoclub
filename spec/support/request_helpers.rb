module Request
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end

    # When querying Item, to get movies and seasons together
    # I have no way to know the name of the root in the json response
    # It will depende on the type of the first object returned
    def root_name(json)
      json.keys[0]
    end
  end
end
