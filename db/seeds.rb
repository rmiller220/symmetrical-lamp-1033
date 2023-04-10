# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CustomerItem.destroy_all
Customer.destroy_all
Item.destroy_all
Supermarket.destroy_all
@ks = Supermarket.create!(name: 'King Soopers', location: '123 main st')
@sprouts = Supermarket.create!(name: 'Sprouts', location: '123 main st')
@ng = Supermarket.create!(name: 'Natural Grocers', location: '123 main st')
@banana = @ks.items.create!(name: 'Banana', price: '1')
@apple = @ks.items.create!(name: 'Apple', price: '2')
@coffee = @ks.items.create!(name: 'Coffee', price: '9')
@orange = @sprouts.items.create!(name: 'Orange', price: '1')
@hotdog = @sprouts.items.create!(name: 'Hotdog', price: '7')
@cereal = @sprouts.items.create!(name: 'Cereal', price: '5')
@lettuce = @ng.items.create!(name: 'Lettuce', price: '4')
@burger = @ng.items.create!(name: 'Burger', price: '12')
@grapes = @ng.items.create!(name: 'Grapes', price: '6')
@ashley = Customer.create!(name: 'Ashley')
@reilly = Customer.create!(name: 'Reilly')
@aspen = Customer.create!(name: 'Aspen')

@ci_1 = CustomerItem.create!(item: @grapes, customer: @aspen)
@ci_2 = CustomerItem.create!(item: @apple, customer: @aspen)
@ci_3 = CustomerItem.create!(item: @hotdog, customer: @aspen)
@ci_4 = CustomerItem.create!(item: @burger, customer: @reilly)
@ci_5 = CustomerItem.create!(item: @lettuce, customer: @reilly)
@ci_6 = CustomerItem.create!(item: @cereal, customer: @reilly)
@ci_7 = CustomerItem.create!(item: @coffee, customer: @ashley)
@ci_8 = CustomerItem.create!(item: @banana, customer: @ashley)
@ci_9 = CustomerItem.create!(item: @orange, customer: @ashley)