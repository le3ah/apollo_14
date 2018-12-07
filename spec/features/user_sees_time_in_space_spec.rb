require 'rails_helper'

describe 'astronaut index page' do
  describe 'as a visitor' do
    it 'sees astronaut information' do
      astronaut_1 = Astronaut.create(name: "John", age: 45, job: "pilot")
      astronaut_2 = Astronaut.create(name: "Jim", age: 42, job: "captain")
      mission_1 = astronaut_1.missions.create(title: "Apollo 13", time_in_space: 32)
      mission_2 = astronaut_1.missions.create(title: "Capricorn 4", time_in_space: 42)
      mission_3 = astronaut_2.missions.create(title: "Gemini 7", time_in_space: 39)

      visit astronauts_path

      expect(page).to have_content(astronaut_1.time_in_space)
      expect(page).to have_content(astronaut_1.age)

    end
  end
end
