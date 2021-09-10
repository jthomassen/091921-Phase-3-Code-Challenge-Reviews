# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
review1 = Review.create(star_rating: 4, comment: "Why would you say something like this?", product_id: product1.id, user_id: user2.id)
review2 = Review.create(star_rating: 3, comment: "This is commodity is insatiable. Wow.", product_id: product2.id, user_id: user3.id)
review3 = Review.create(star_rating: 4, comment: "You're*", product_id: product3.id, user_id: user1.id)
review4 = Review.create(star_rating: 1, comment: "First comment", product_id: product1.id, user_id: user3.id)
review5 = Review.create(star_rating: 2, comment: "You did a bad job, user1", product_id: product5.id, user_id: user1.id)

puts
puts "User and Product Instances for review1:"
puts review1.user.name
puts review1.product.name
puts
puts "All reviews for #{product1.name}s:"
puts product1.reviews.map(&:comment)
puts
puts "All users who reviewed #{product1.name}s:"
puts product1.users.map(&:name)
puts
puts "All reviews for #{user3.name}:"
puts user3.reviews.map(&:comment)
puts
puts "All products reviewed by #{user3.name}:"
puts user3.products.map(&:name)
puts
puts "Printing review..."
review5.print_review
puts
puts "Leaving review..."
new_review = product4.leave_review(user2, 3, "What a shameful little device")
puts new_review.comment
puts
puts "Printing all reviews for #{product1.name}s:"
puts product1.print_all_reviews
puts
# puts "Avg star rating for product1:"
# puts product1.average_rating
puts
puts "#{user1.name}'s Favorite Product:"
puts user1.favorite_product.name
puts
puts "Removing reviews for #{product5.name}s:"
puts user1.remove_reviews(product5)
puts
puts "Seeding done!"