
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
    
    def price_code=(price_code)
        @price = price_code
    end

    
    def charge(days_rented)
        @price.charge(days_rented)
    end
    
    def freq_renter_points(days_rented)
        @price.frequent_renter_points(days_rented)
    end
end
