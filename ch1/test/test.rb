require 'test/unit'
require File.expand_path(File.dirname(__FILE__)) + '/../src/customer'
require File.expand_path(File.dirname(__FILE__)) + '/../src/movie'
require File.expand_path(File.dirname(__FILE__)) + '/../src/rental'

class MyTest < Test::Unit::TestCase

    def testRegularMovieOneDayRented
        movie = Movie.new("I PUFFI", 0)
        rental = Rental.new(movie, 1)
        customer = Customer.new("Carlo")
        customer.add_rental(rental)
        expected = "Rental Record for Carlo I PUFFI Amount owned is 2 You earned 1 frequent renter points"
        assert_equal(expected, customer.statement)
    end

    def testRegularMovieThreeDayRented
        movie = Movie.new("I PUFFI", 0)
        rental = Rental.new(movie,3)
        customer = Customer.new("Carlo")
        customer.add_rental(rental)
        expected = "Rental Record for Carlo I PUFFI Amount owned is 3.5 You earned 1 frequent renter points"
        assert_equal(expected, customer.statement)
    end
end

