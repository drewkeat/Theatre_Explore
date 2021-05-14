class Scraper
    attr_accessor :page, :input, :label
    def initialize(type, input)
        @input = input
        case type
        when "year"
            scrape_year(input)
        when "show"
            scrape_show(input)
        else
            nil
        end
    end

    def scrape_year(year)
        agent = Mechanize.new
        @page = agent.get("https://www.broadwayworld.com/browseshows.cfm?showtype=BR&open_yr=#{year}")
        @label = year
        build_year
    end

    def build_year
        #returns hash with production titles as keys and production links as values
        shows = {}
        list_object = @page.search("p+ ul li")
        list_object.each do |show|
            shows[show.text] = show.at("a").attribute("href").value
        end
        Year.new(@label, shows)
    end

end