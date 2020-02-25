json.array! @parties do |party|
  json.name party.name
  json.location party.location
end


# json.guests do
#   @parties.each do |party|
#     party.guests.each do |guest|
#       json.extract! guest, :guest_id
#     end
#   end
# end

