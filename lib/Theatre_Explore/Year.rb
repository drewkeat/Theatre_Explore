class Year
    attr_accessor :label, :productions
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
    # DELETE THIS METHOD ONCE ITTERATIVE PRODUCTION SCRAPING HAPPENS WITHIN YEAR SCRAPES 
    def production_select(choice)
        url = @productions[@productions.keys[choice-1]]
        ProductionScraper.new(url)
    end

    def self.find(year)
        @@all.detect {|ele| ele.label == year}
    end

    def self.valid?(year)
        year.to_i > 1832
    end

    def print
        self.productions.keys.each.with_index(1) {|show, i| puts "#{i}. #{show}"}
    end
end