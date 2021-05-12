class ProductionScraper
    attr_accessor :page, :creative, :cast, :main
    def initialize(url)
        agent = Mechanize.new
        @page = agent.get(url)
    end

    def get_pages
        @creative = @page.link_with(:text => "Creative").click
        @cast = @page.link_with(:text => "Cast").click
        @main = @page.link_with(:href => /shows\/.*\d*\.html/).click
    end

    def strip_attributes
        @cast
        p_info = @page.search(".production-info td").map {|ele| ele.text}
        
    end

    def create_show
        show_label = @page.title[/^[^-]*/].strip
        
        if !!Show.exist?(show_label)
            ShowScraper.new(self.main.uri.to_s)
        end
    end
end