# http://tce.cit.api.here.com/2/tollcost.json?
#

class HereMaps::TollsRepo
  include HTTParty
  base_uri 'http://tce.cit.api.here.com'

  def initialize()
    @options =  HereMaps::Config.sign({ query: {
        rollup: 'country;tollsys',
        route: '',
        currency: 'EUR'
      }
    })
  end

  def tolls(link_ids)
    @options[:query][:route] = link_ids

    self.class.get('/2/tollcost.json', @options).to_s
  end
end
