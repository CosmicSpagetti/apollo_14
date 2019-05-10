require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "class method" do
    it "should get average age" do
      astronaut_1 =  Astronaut.create!(name: "BOB", age: 40, job: "space jams")
      astronaut_2 =  Astronaut.create!(name: "billy", age: 28, job: "space walks")

      expect(Astronaut.average_age).to eq(34)
    end
  end
end
