class Year
    attr_accessor :label, :productions, :display_list
    @@all = []

    def initialize(label, list)
        @label = label
        @display_list = list
        @productions = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create(year)
        if @@all.detect {|ele| ele.label == year}
            @@all.detect {|ele| ele.label == year}
        else
            Scraper.new('year', year)
        end
        @@all.detect {|ele| ele.label == year}
    end

    def self.valid?(year)
        year.to_i > 1832
    end

    def print
        self.display_list.keys.each.with_index(1) {|show, i| puts "#{i}. #{show}"}
    end

    def select_production(input)
        show = self.display_list.keys[input - 1]
        production = productions.detect {|e| e.show == show}
    end
end