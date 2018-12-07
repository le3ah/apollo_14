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
end

describe "Class Methods" do
  it ".average_age" do
    Astronaut.create(name: "Jim Carrey", age: 56, job: "Comedian")
    Astronaut.create(name: "Demetri Martin", age: 45, job: "Chef")

    expect(Astronaut.average_age).to eq(50)
  end
end
