require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit

sam = BestFriend.new('', 1, '')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet

class CheeseError < StandardError 

end 

def cheese_stuff
  begin
    raise CheeseError
  rescue CheeseError
    "do rescue stuff"
  ensure
    "do this always"
  end
end