class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://www.potterapi.com/v1/') do |faraday|
      faraday.params['key'] = '$2a$10$x70VsNbT0A48qM3vLoYXe.wZeXd5qOEKryr75MSeX1AxXzrc9hTMm'
      faraday.params['house'] = 'Gryffindor'
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get('characters')

    json = JSON.parse(response.body, symbolize_names: true)
    @members = json
  end
end
