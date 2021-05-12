class Year
    attr_accessor :productions, :label
    @@all = []

    def initialize(label, productions)
        @productions = productions 
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
        url = @productions[@productions.keys[choice-1]]
        #Production_Scraper.new(url)
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
        self.productions.keys.each.with_index(1) {|show, i| puts "#{i}. #{show}"}
    end
end