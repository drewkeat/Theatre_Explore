class Production
    attr_accessor :show, :label, :year, :type, :details
    @@all = []
    def initialize(show, label, year, type, details)
        @show = show
        @type = type
        @label = label
        @year = year
        @year = Time.now.year.to_s if @year == nil
        @details = details
        self.save
        join_show(@show)
        join_year(@year)
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
        if Year.find_or_create(year)
            Year.find_or_create(year).productions << self
        else
            Scraper.new("year", year)
            Year.find_or_create(year).productions << self
        end
    end

    def print
        puts "========================"
        puts "#{@label}"
        puts "========================"
        puts "Show type: #{type}"
        puts ""
        puts "
        Summary:\n
        #{details.values.first}\n
        "
        details.keys.each.with_index do |k, i|
            puts "#{k.rjust(16)} ------ #{details[k]}" if i > 0
        end
    end
end