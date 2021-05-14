class Production
    attr_accessor :show, :label, :year, :type #:details, :cast, :crew
    @@all = []
    def initialize(show, label, year, type)
        @show = show
        @type = type
        @label = label
        @year = year
        @year = Time.now.year if @year == nil
        self.save
        join_show(show)
        join_year(year)
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
            s = Show.new(show, @type)
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

    def print
        puts "========================"
        puts "#{@label}"
        puts "========================"
        puts "Show type: #{type}"
        puts ""
        puts "Details will be placed here"
    end
end