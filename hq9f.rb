def h (name="world")
  puts "Hello #{name}!"
end

def ninty_nine (bottles=99)
  bottle_word = lambda do
    if bottles == 1
      "1 bottle"
    elsif bottles == 0
      "no more bottles"
    else
      "#{bottles} bottles"
    end
  end
  wall_clause   = lambda { "#{bottle_word.call} of beer on the wall" }
  bottle_clause = lambda { "#{bottle_word.call} of beer.\n" }
  take_clause = "Take one down pass it around, "

  sing_verse = lambda do
    puts wall_clause.call + ", " + bottle_clause.call
    bottles -= 1
    puts take_clause + wall_clause.call + ".\n\n"
  end

  bottles.times do
    sing_verse.call
  end
end

def f (min, max, subs)
  factorzz = lambda do |num|
    str = ""
    subs.each_pair do |key, value|
      if num % key == 0
        str += value
      end
    end
    return str.empty? ? num.to_s : str
  end

  min.upto(max) do |n|
    puts factorzz.call(n)
  end
end

def q ()
  qq = ["def q ()", "  qq = ", "  qq[1] += qq.to_s", "  str = \"\"", "  qq.each {|s| str += (s + \"\n\")}", "  puts str", "end"]
  qq[1] += qq.to_s
  str = ""
  qq.each {|s| str += (s + "\n")}
  puts str
end

# TODO: maybe wrap this up as a module providing these methods.



require 'minitest/autorun'

class TestHQ9F < MiniTest::Unit::TestCase
  def test_h
    assert_output "Hello world!\n" do
      h
    end
  end

  def test_h_string
    out, err = capture_io do
      h("adf")
    end
    assert_match /Hello .*!/, out
  end
end
