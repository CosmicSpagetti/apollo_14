require 'rails_helper'


RSpec.describe "Index page for astronauts" do
  before :each do
    @astronaut_1 =  Astronaut.create!(name: "BOB", age: 40, job: "space jams")
    @astronaut_2 =  Astronaut.create!(name: "billy", age: 25, job: "space walks")
    @astronaut_3 =  Astronaut.create!(name: "chris", age: 27, job: "space talk")
    @astronaut_4 =  Astronaut.create!(name: "alex", age: 30, job: "space tools")
    @astronaut_5 =  Astronaut.create!(name: "yes", age: 100, job: "okay")
    @mission_1 = @astronaut_1.mission.create!(title: "mars", time_in_space: 20)
    @mission_2 = @astronaut_2.mission.create!(title: "mars 2", time_in_space: 50)
  end
  describe "should show all astronauts " do

    it "should show name age and job with astronauts" do

      visit "/astronauts"

      array_of_astronauts = [@astronaut_1,@astronaut_2,@astronaut_3,@astronaut_4, @astronaut_5]

      array_of_astronauts.each do |astronaut|
        within "#astronaut-#{astronaut.id}" do
          expect(page).to have_content(astronaut.name)
          expect(page).to have_content(astronaut.age)
          expect(page).to have_content(astronaut.job)
        end
      end
    end

    it "and i should see average age of all astronauts" do
      visit '/astronauts'

      average_age= Astronaut.average(:age)

      expect(page).to have_content("Average Age: #{average_age}")

    end

    it "should show list of space missions under the astronaut in alphabetical order" do

      within "astronaut-#{@astronaut.id}" do
        expect(page).to have_content()

      end

    end
  end

end
