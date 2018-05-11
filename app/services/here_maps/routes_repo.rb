class HereMaps::RoutesRepo
  include HTTParty
  base_uri 'route.cit.api.here.com/routing'

  def initialize()
    @options = HereMaps::Config.sign({ query: {
        waypoint0:'geo!41.38506389999999,2.1734034999999494',
        waypoint1:'geo!40.4167754,-3.7037901999999576',
        routeattributes:'wp,sm,sh,sc',
        mode:'fastest;car',
        representation: 'linkPaging'
      }
    })
  end

  def calculateroute(departure, destination)
    @options[:query][:waypoint0] = departure
    @options[:query][:waypoint1] = destination

    xml = self.class.get('/7.2/calculateroute.xml', @options).to_s
    HereMaps::Route.new(xml)
  end
end
