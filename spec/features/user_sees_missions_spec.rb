require 'rails_helper'

describe 'astronaut index page' do
  describe 'as a visitor' do
    it 'sees a list of the space missions in alphabetical order' do
      astronaut_1 = Astronaut.create(name: "John", age: 45, job: "pilot")
      astronaut_2 = Astronaut.create(name: "Jim", age: 42, job: "captain")

      mission_1 = astronaut_1.missions.create(title: "Apollo 13", time_in_space: 32)
      mission_2 = astronaut_1.missions.create(title: "Capricorn 4", time_in_space: 42)
      mission_3 = astronaut_2.missions.create(title: "Gemini 7", time_in_space: 39)

      visit astronauts_path

      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(mission_1.title)
      expect(page).to have_content(mission_2.title)

      expect(page).to have_content(astronaut_2.name)
      expect(page).to have_content(mission_3.title)
    end
  end
end
