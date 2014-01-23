
require 'test/unit'

class Account

    def gamma(input_val, quantity, year_to_date)
        imp_value1 = (input_val * quantity) -20
        imp_value2 = (input_val * year_to_date) /quantity
        if (input_val > 10)
            imp_value2 = 50
        end
        return  imp_value1 - imp_value2
    end
end




class MyTest < Test::Unit::TestCase

    def testMethod
        assert_equal(6, Account.new.gamma(10, 5, 12))
    end
end
