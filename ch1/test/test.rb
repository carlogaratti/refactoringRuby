require 'test/unit'
require File.expand_path(File.dirname(__FILE__)) + '/../src/customer'
require File.expand_path(File.dirname(__FILE__)) + '/../src/movie'
require File.expand_path(File.dirname(__FILE__)) + '/../src/rental'
require File.expand_path(File.dirname(__FILE__)) + '/../src/price'

class MyTest < Test::Unit::TestCase

    def testRegularMovieOneDayRented
        movie = Movie.new("I PUFFI", RegularPrice.new)
        rental = Rental.new(movie, 1)
        customer = Customer.new("Carlo")
        customer.add_rental(rental)
        expected = "Rental Record for Carlo I PUFFI Amount owned is 2 You earned 1 frequent renter points"
        assert_equal(expected, customer.statement)
    end

    def testRegularMovieThreeDayRented
        movie = Movie.new("I PUFFI", RegularPrice.new)
        rental = Rental.new(movie,3)
        customer = Customer.new("Carlo")
        customer.add_rental(rental)
        expected = "Rental Record for Carlo I PUFFI Amount owned is 3.5 You earned 1 frequent renter points"
        assert_equal(expected, customer.statement)
    end
    
    def testNewReleasMovie
        movie = Movie.new("DALTANIUS", NewReleasePrice.new)
        rental = Rental.new(movie,2)
        customer = Customer.new("Carlo")
        customer.add_rental(rental)
        expected = "Rental Record for Carlo DALTANIUS Amount owned is 2 You earned 2 frequent renter points"
        assert_equal(expected, customer.statement)
    end
    
    def testChildrentMovieWithFourDaysRented
        movie = Movie.new("HELLOSPANK", ChildrenPrice.new)
        rental = Rental.new(movie,4)
        customer = Customer.new("Carlo")
        customer.add_rental(rental)
        expected = "Rental Record for Carlo HELLOSPANK Amount owned is 3.0 You earned 1 frequent renter points"
        assert_equal(expected, customer.statement)
    end
end

