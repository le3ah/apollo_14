require 'rails_helper'

describe 'astronaut index page' do
  describe 'as a visitor' do
    it 'sees astronaut information' do
      astronaut_1 = Astronaut.create(name: "John", age: 45, job: "pilot")
      astronaut_1.missions.create(title: "Apollo 13", time_in_space: 32)
      astronaut_1.missions.create(title: "Capricorn 4", time_in_space: 42)

      visit astronauts_path

      expect(page).to have_content("#{Astronaut.total_time_in_space}")

    end
  end
end
