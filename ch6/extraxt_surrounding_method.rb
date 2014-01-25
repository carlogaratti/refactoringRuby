def charge (amount, credit_card_number)
       connect { |db|  db.save(amount, credit_card_number)}
end

def connect 
    begin
        db = DB::connect()
        yield db       
        "OK"
    rescue IOError => e
        puts 'error'
    ensure
        "OK"
    end
end

class DB
    def self.connect
        Connection::connection
    end
end
class Connection
    def self.connection
        Connection.new
    end
    def save (amount, credit_card_number)
    end
end

require 'test/unit'

class MyTest < Test::Unit::TestCase
    def testcharge()
        assert_equal("OK", charge(100, 666))
    end
end


