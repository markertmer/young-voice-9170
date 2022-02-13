require 'rails_helper'

RSpec.describe 'Professors Index Page' do

  it 'lists all professors with name, age, and specialty' do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.age)
    expect(page).to have_content(snape.specialty)

    expect(page).to have_content(hagarid.name)
    expect(page).to have_content(hagarid.age)
    expect(page).to have_content(hagarid.specialty)

    expect(page).to have_content(lupin.name)
    expect(page).to have_content(lupin.age)
    expect(page).to have_content(lupin.specialty)
  end

  it 'lists professors alphabetically by name' do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    within("#professor-1") do
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(lupin.age)
      expect(page).to have_content(lupin.specialty)
    end

    within("#professor-2") do
      expect(page).to have_content(hagarid.name)
      expect(page).to have_content(hagarid.age)
      expect(page).to have_content(hagarid.specialty)
    end

    within("#professor-3") do
      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end
  end
end
