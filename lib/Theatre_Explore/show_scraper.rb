class ShowScraper
    attr_accessor :label, :page
    def initialize(url)
        agent = Mechanize.new
        @page = agent.get(url)
    end

    def build_show
        details = build_details
        cast = get_cast
        creative = get_creative

        Show.new(details, cast, creative)
    end

    def build_details
        final = {}
        head = page.search("h1+ h2").text.gsub(" Show Information","")
        details_o = @page.search(".production-info td").map {|d| d.text}
            details_o.each.with_index do |d,i|
                if i % 2 == 0
                    final[d] = details_o[i+1]
                end
            end
        final[:title] = head
        final
    end

    def get_cast

    end

    def get_creative

    end

end