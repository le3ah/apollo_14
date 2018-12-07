require 'rails_helper'

describe 'astronaut index page' do
  describe 'as a visitor' do
    it 'sees astronaut information' do
      astronaut_1 = Astronaut.create(name: "John", age: 45, job: "pilot")
      astronaut_2 = Astronaut.create(name: "Jim", age: 42, job: "captain")
      astronaut_3 = Astronaut.create(name: "Jane", age: 40, job: "co-pilot")

      visit astronauts_path

      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(astronaut_1.age)
      expect(page).to have_content(astronaut_1.job)
      expect(page).to have_content(astronaut_2.name)
      expect(page).to have_content(astronaut_2.age)
      expect(page).to have_content(astronaut_2.job)
      expect(page).to have_content(astronaut_3.name)
      expect(page).to have_content(astronaut_3.age)
      expect(page).to have_content(astronaut_3.job)

      expect(page).to have_content("#{Astronaut.average_age}")
    end
  end
end
