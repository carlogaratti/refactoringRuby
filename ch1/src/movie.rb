
require File.expand_path(File.dirname(__FILE__)) + '/../src/price'

class Movie
    REGULAR = 0
    NEW_RELEASE = 1
    CHILDRENS = 2

    attr_reader :title
    attr_reader :price_code

    def initialize(title, price_code)
        @title, self.price_code = title, price_code
    end
    
    def price_code=(value)
        @price_code = value
        @price = case price_code
                 when REGULAR 
                     RegularPrice.new
                 when NEW_RELEASE 
                     NewReleasePrice.new
                 when CHILDRENS 
                     ChildrenPrice.new
                 end
    end

    
    def charge(days_rented)
            this_amount = 0
            case price_code
            when REGULAR
               return @price.charge(days_rented)
            when NEW_RELEASE
               return @price.charge(days_rented)
            when CHILDRENS
               return @price.charge(days_rented)
            end
            this_amount
    end
    
    def freq_renter_points(days_rented)
        (price_code == NEW_RELEASE && days_rented > 1)? 2: 1
    end
end
