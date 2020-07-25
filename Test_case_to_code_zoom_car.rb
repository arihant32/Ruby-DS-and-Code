==begin
 You are given the below class and if you all the below file then you can see all the test cases are failing.
 So you need to complete the "find method of Activity class" in a way that all the test cases should pass.
==end

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
