class ShowScraper
    attr_accessor :page, :show
    def initialize(url)
        agent = Mechanize.new
        @page = agent.get(url) #lk 
        self.build_show
    end

    def build_show
        details = build_details
        title = @page.search(".header").text.gsub(/\s-.*/,"")
        @show = Show.new(title, details)
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