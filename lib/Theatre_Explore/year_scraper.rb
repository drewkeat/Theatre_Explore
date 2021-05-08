class YearScraper
    attr_accessor :page, :name
    def initialize(year)
        agent = Mechanize.new
        @page = agent.get("https://www.broadwayworld.com/browseshows.cfm?showtype=BR&open_yr=#{year}")
        @name = "#{year}_scraper"
    end

    def build_year
        #returns hash with shows text as keys and shows links as values
        list_object = @page.search("p+ ul li")
        #list_object.each.first = Show Link & Title
        #list_object.children[2] = Opening Date
        #list_object.children[]



    end
end