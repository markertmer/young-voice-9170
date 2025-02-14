require 'rails_helper'

RSpec.describe 'Students Index Page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end


  it 'lists the name of each student' do
    visit '/students'

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@longbottom.name)
  end

  it 'gives the number of professors that each student has' do
    visit '/students'

    within("#student-#{@harry.id}") do
      expect(page).to have_content("3")
    end

    within("#student-#{@malfoy.id}") do
      expect(page).to have_content("2")
    end

    within("#student-#{@longbottom.id}") do
      expect(page).to have_content("1")
    end
  end

  it 'lists students aphabetically by name' do
    visit '/students'

    within(".index-1") do
      expect(page).to have_content(@malfoy.name)
      expect(page).to have_content("2")
    end

    within(".index-2") do
      expect(page).to have_content(@harry.name)
      expect(page).to have_content("3")
    end

    within(".index-3") do
      expect(page).to have_content(@longbottom.name)
      expect(page).to have_content("1")
    end
  end
end
