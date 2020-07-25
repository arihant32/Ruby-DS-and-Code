=begin
 You are given the below class and if you all the below file then you can see all the test cases are failing.
 So you need to complete the "find method of Activity class" in a way that all the test cases should pass.
=end

class FakeData

  class << self

    def all
      (1..10).to_a
    end

    def created
      [4, 5, 6, 8, 9]
    end

    def users
      [1, 2, 4, 5, 6]
    end

    def accounts
      [3, 7, 8, 9, 10]
    end

    def updated
      [2, 3, 6, 7, 8, 9, 10]
    end
  end
end

class Activity < FakeData

  def self.find(options={})
  end
end

if __FILE__ == $PROGRAM_NAME

  require 'minitest/autorun'

  class ActivityTest < Minitest::Test

    def test_one
      assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], Activity.find
    end

    def test_two
      assert_equal [4, 5, 6], Activity.find(:indexes => {:type => :users, :action => :created})
    end

    def test_three
      assert_equal [2, 3, 6, 7, 8, 9, 10], Activity.find(:indexes => {:type => [:accounts, :users], :action => :updated})
    end

    def test_four
      assert_equal [2, 3, 4, 5, 6, 7, 8, 9, 10],
        Activity.find(:indexes => {:type => [:accounts, :users], :action => [:updated, :created]})
    end

    def test_five
      assert_equal [3, 7, 8, 9, 10],
        Activity.find(:indexes => {:type => :accounts, :action => [:updated, :created]})
    end
  end
end

=begin

ajain$ ruby FakeData.rb
Run options: --seed 52438

# Running:

FFFFF

Finished in 0.019041s, 262.5912 runs/s, 262.5912 assertions/s.

  1) Failure:
ActivityTest#test_four [FakeData.rb:52]:
Expected: [2, 3, 4, 5, 6, 7, 8, 9, 10]
  Actual: nil

  2) Failure:
ActivityTest#test_five [FakeData.rb:57]:
Expected: [3, 7, 8, 9, 10]
  Actual: nil

  3) Failure:
ActivityTest#test_one [FakeData.rb:40]:
--- expected
+++ actual
@@ -1 +1 @@
-[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
+nil


  4) Failure:
ActivityTest#test_three [FakeData.rb:48]:
Expected: [2, 3, 6, 7, 8, 9, 10]
  Actual: nil

  5) Failure:
ActivityTest#test_two [FakeData.rb:44]:
Expected: [4, 5, 6]
  Actual: nil

5 runs, 5 assertions, 5 failures, 0 errors, 0 skips


=end


## My solution


class Activity < FakeData

  def self.find(options={})
    return all if options.empty?
    return unless is_valid?(options)
    indexes = options[:indexes]
    types = indexes[:type].is_a?(Array) ? indexes[:type] : [indexes[:type]]
    actions = indexes[:action].is_a?(Array) ? indexes[:action] : [indexes[:action]]
    (get_combine_array(types) & get_combine_array(actions)).sort
  end

  def self.is_valid?(options)
    return unless options.key?(:indexes)
    options[:indexes].key?(:type) || options[:indexes].key?(:action)
  end

  def self.get_combine_array array
    # array.each_with_object([]) { |md, arr| arr << send(md) }.flatten
    # or
    # array.each_with_object([]) { |md, arr| arr.push(*send(md)) }
    # or 
    result = []
    array.each_with_object([]) { |md, arr|  result += send(md) }
    result
  end
 
end


