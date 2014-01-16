require File.expand_path(File.dirname(__FILE__)) + '/../src/amount_strategy'
require File.expand_path(File.dirname(__FILE__)) + '/../src/frequent_renter'
require File.expand_path(File.dirname(__FILE__)) + '/../src/amount_newrelease_strategy'

class Customer
    attr_reader :name

    def initialize(name,amountStrategy)
        @name = name
        @rentals = []
        @amountStrategy = amountStrategy
        @frequentRenter = FrequentRenter.new
    end

    def add_rental(args)
        @rentals << args
    end

    def statement
        total_amount, frequent_renter_points = 0,0, result = '' 
        title_names = ''
        @rentals.each do |element|
            frequent_renter_points += @frequentRenter.sum(frequent_renter_points, element)
            title_names += element.movie.title + " " 
            total_amount += lookupAmountStrategy(element.movie.price_code).amount(element)
        end

        result += printNamesOn(title_names)
        result += printTotalOn(total_amount, frequent_renter_points)
        result 
    end


    def lookupAmountStrategy(price_code)
        @amountStrategy[price_code]
    end 
    
    def  printNamesOn(title_names)
       "Rental Record for #{@name} " + title_names
    end

    def  printTotalOn(total_amount, frequent_renter_points)
        "Amount owned is #{total_amount} " + 
                  "You earned #{frequent_renter_points} frequent renter points"
    end
end
