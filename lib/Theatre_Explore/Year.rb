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

    def self.find(year)
        @@all.detect {|ele| ele.label = year}
    end

    def self.exist?(year)
        !!self.find(year)
    end

    def self.print(year)
        y = self.find(year)
        y.shows.keys.each.with_index(1) {|show, i| puts "#{i}. #{show}"}
    end
end