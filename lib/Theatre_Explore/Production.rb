class Production
    attr_accessor :show, :label, :year #:details, :cast, :crew
    @@all = []
    def initialize(show, label, year)
        @show = show
        @label = label
        join_show(show)
        @year = year
        join_year(year)
        self.save
    end

    def self.all
        @@all
    end

    def self.find(label)
        @@all.detect {|p| p.label == label}
    end

    def save
        @@all << self
    end

    def join_show(show)
        if Show.find(show)
            Show.find(show).productions << self
        else
            s = Show.new(show)
            s.productions << self
        end
    end

    def join_year(year)
        if Year.find(year)
            Year.find(year).productions << self
        else
            Scraper.new("year", year)
            Year.find(year).productions << self
        end
    end
end