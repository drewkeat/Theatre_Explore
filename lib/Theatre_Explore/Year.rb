class Year
    attr_accessor :shows, :label
    @@all = []

    def initialize(label, shows)
        @shows = shows 
        @label = label
        save
    end

    # def self.find_production

    # end

    def save
        @@all << self
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