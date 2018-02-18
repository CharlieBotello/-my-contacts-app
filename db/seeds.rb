# 100.times do 
#   first_name =  Faker::Name.first_name
#   last_name = Faker::Name.last_name

# contact = Contact.new(
#                             first_name: first_name,
#                             last_name: last_name,
#                             email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
#                             phone_number: Faker::PhoneNumber.phone_number

#                           )
# contact.save
# end 
# contacts.times each do |contact|
#   contact = Contact.update(
#                               bio: Faker::MostInterestingManInTheWorld.quote
#                         )
#   contact.save
# end 