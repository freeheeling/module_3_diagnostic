class HouseMemberSearch
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def member_count
    members.count
  end

  def members
    conn = Faraday.new(url: 'https://www.potterapi.com/v1/') do |faraday|
      faraday.params['key'] = ENV['POTTER_API_KEY']
      faraday.params['house'] = house
      faraday.params['orderOfThePhoenix'] = 'true'
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get('characters')

    JSON.parse(response.body, symbolize_names: true)
  end
end
