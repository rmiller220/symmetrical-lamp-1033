require 'rails_helper'

RSpec.describe "customer show page" do
  describe "visit customer show page" do
    before(:each) do
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

    end
    it "I see a customer's name, and list of its items including
    the item's name, price, and the name of the supermarket that
    belongs to" do
      visit "customers/#{@aspen.id}"
      expect(page).to have_content(@aspen.name)

      within "#item-#{@grapes.id}" do
        expect(page).to have_content(@ng.name)
        expect(page).to have_content(@grapes.name)
        expect(page).to have_content("$#{@grapes.price}")
      end

      within "#item-#{@apple.id}" do 
        expect(page).to have_content(@ks.name)
        expect(page).to have_content(@apple.name)
        expect(page).to have_content("$#{@apple.price}")
      end

      within "#item-#{@hotdog.id}" do
        expect(page).to have_content(@sprouts.name)
        expect(page).to have_content(@hotdog.name)
        expect(page).to have_content("$#{@hotdog.price}")
      end

      # save_and_open_page
      visit "customers/#{@reilly.id}"

      expect(page).to have_content(@reilly.name)
      within "#item-#{@cereal.id}" do
        expect(page).to have_content(@sprouts.name)
        expect(page).to have_content(@cereal.name)
        expect(page).to have_content("$#{@cereal.price}")
      end
      
      within "#item-#{@burger.id}" do
        expect(page).to have_content(@ng.name)
        expect(page).to have_content(@burger.name)
        expect(page).to have_content("$#{@burger.price}")
      end

      within "#item-#{@lettuce.id}" do
        expect(page).to have_content(@ng.name)
        expect(page).to have_content(@lettuce.name)
        expect(page).to have_content("$#{@lettuce.price}")
      end
    end
  end
end

# Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price,
# and the name of the supermarket that it belongs to.