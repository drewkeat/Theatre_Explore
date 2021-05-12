class Show
    attr_accessor :label, :details
    
    @@all = []

    def initialize(label, details)
        @label = label
        @details = details
        self.save
    end

    def print
        puts "========================"
        puts "#{@label}"
        puts "========================"
        puts details
    end

    def self.all
        @@all
    end

    def self.find(label)
        @@all.detect {|ele| ele.label == label}
    end

    def save
        @@all << self
    end
end