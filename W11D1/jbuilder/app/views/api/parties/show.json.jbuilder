json.extract! @party, :name, :location

json.guests do
  @party.guests.each do |guest|
    json.extract! guest, :name
    # guest.gifts.each do |gift|
    #   json.extract! gift, :title
    # end
  end
end