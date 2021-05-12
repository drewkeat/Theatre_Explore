class Year
    attr_accessor :shows, :label
    @@all = []

    def initialize(label, shows)
        @shows = shows 
        @label = label
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def production_select(choice)
        url = @shows[@shows.keys[choice-1]]
        ShowScraper.new(url).show.print

    end

    def self.find(year)
        @@all.detect {|ele| ele.label == year}
    end

    def self.exist?(year)
        !!self.find(year)
    end

    def self.valid?(year)
        year.to_i > 1832
    end

    def print
        self.shows.keys.each.with_index(1) {|show, i| puts "#{i}. #{show}"}
    end
end