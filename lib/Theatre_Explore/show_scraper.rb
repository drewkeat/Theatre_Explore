class ShowScraper
    attr_accessor :page
    def initialize(url)
        agent = Mechanize.new
        @page = agent.get(url) #lk 
    end

    def build_show
        details = page.search("style+ .col-12")
        title = page.search(".header").text.gsub(/\s-.*/,"")
        Show.new(title, details)
    end

    def build_details
     details = ""
     object = @page.search("style+ .col-12")
     object.children.each.with_index do |detail, i|
        if i.between?(4,10)
            details += detail
        end
     end
     details
    end
end