class Scraper
    attr_accessor :page, :input
    def initialize(type, input)
        @input = input
        case type
        when "year"
            scrape_year(input)
        when "show"
            scrape_show(input)
        when "search"
            scrape_search(input)
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
        @page = Mechanize.new.get(url).link_with(:href => /backstage.php/).click
        show = page.at("h1").text.gsub(' Production History','')
        @main_page = @page.link_with(:href => /shows\/.*\d*\.html/).click
        year = @main_page.at(".header").text[/\d{4}/]
        label = @main_page.at(".header").text
        type = self.get_type
        details = get_details
        Production.new(show, label, year, type, details) if !Production.find(label)
    end

    def get_type
        table = @page.search(".production-table span")
        table.each.with_index do |e, i|
            if e.text == "Show type"
                return table[i + 1].text
            end
        end
    end

    def get_details
        hash = {}
        if @main_page.at("style+ .col-12").text[/; (\w.*\.)\w/]
            summary = @main_page.at("style+ .col-12").text[/; (\w.*\.)\w/]
            summary = /; (\w.*\.)\w/.match(summary)[1].strip
        else
            summary = "Not available for this production."
        end
        hash["Summary:"] = summary
        details = page.search(".production-info td")
        details.each.with_index do |d, i|
            hash[d.text] = details[i+1].text if i % 2 == 0
        end
        hash
    end

    def scrape_search(input)
        results = {}
        form = Mechanize.new.get("https://www.broadwayworld.com").forms.first
        form.field("q").value = input
        @page = form.submit
    end
end