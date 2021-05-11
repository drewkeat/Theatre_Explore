class Show
    attr_accessor :details, :cast, :creative
    
    @@all = []

    def initialize(details, cast, creative)
        @details = details
        @cast = cast
        @creative = creative
        self.save
    end

    def save
        @@all << self
    end
end