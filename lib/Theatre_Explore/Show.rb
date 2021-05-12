class Show
    attr_accessor :label, :details
    
    @@all = []

    def initialize(label, details)
        @label = label
        @label = details
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end