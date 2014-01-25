def printRevertUpper aString
    printChanged (aString) {|result| result.upcase}
end


def printChanged aString
    result = aString.reverse
    result = yield result
    result.chop
end
def printRevertLower aString
    printChanged (aString) {|result| result.downcase}
end

require 'test/unit'
class MyTest < Test::Unit::TestCase
    def testPrintRevertUpper
        assert_equal("CB", printRevertUpper('abc'))
    end
    def testPrintRevertLow
        assert_equal("cb", printRevertLower('abc'))
    end
end


