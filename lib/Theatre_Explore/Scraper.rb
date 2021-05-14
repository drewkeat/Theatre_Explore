class Scraper
    attr_accessor :page, :input
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
        list_object = @page.links_with(:href => /showid=/)
        shows = {}
        list_object.each do |show|
            shows[show.text] = show.href
        end
        label = year
        Year.new(label, shows)
    end

    def scrape_show(url)
        @page = Mechanize.new.get(url).link_with(:text => "Production").click
        show = page.at("h1").text.gsub(' Production History','')
        creative_page = @page.link_with(:text => "Creative").click
        cast_page = @page.link_with(:text => "Cast").click
        main_page = @page.link_with(:href => /shows\/.*\d*\.html/).click
        year = main_page.at(".header").text[/\d{4}/]
        label = main_page.at(".header").text
        type = self.get_type
        Production.new(show, label, year, type)
    end

    def get_type
        table = @page.search(".production-table span")
        table.each.with_index do |e, i|
            if e.text == "Show type"
                return table[i + 1].text
            end
        end
    end
end