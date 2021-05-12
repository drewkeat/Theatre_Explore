class YearScraper
    attr_accessor :page, :label
    def initialize(year)
        agent = Mechanize.new
        @page = agent.get("https://www.broadwayworld.com/browseshows.cfm?showtype=BR&open_yr=#{year}")
        @label = year
        build_year if !Year.exist?(@label)
    end

    def build_year
        #returns hash with shows text as keys and shows links as values
        shows = {}
        list_object = @page.search("p+ ul li")
        list_object.each do |show|
            shows[show.text] = show.at("a").attribute("href").value
        end
        Year.new(@label, shows)
    end
end