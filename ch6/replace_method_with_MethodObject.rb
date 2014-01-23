
require 'test/unit'

class Account

    def gamma(input_val, quantity, year_to_date)
      Gamma.new(input_val, quantity, year_to_date).compute
    end
end


class Gamma
    def initialize(input_val, quantity, year_to_date)
        @input_val = input_val
        @quantity = quantity
        @year_to_date = year_to_date
    end

    def compute
        imp_val1 - imp_val2
    end

    def imp_val1
         (@input_val * @quantity) -20
    end

    def imp_val2
        @input_val >10 ? 50 : (@input_val * @year_to_date) / @quantity
    end
end

class MyTest < Test::Unit::TestCase

    def testMethod
        assert_equal(6, Account.new.gamma(10, 5, 12))
    end
end
