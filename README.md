## Reflections
   * Overall I feel pretty good about this IC. Nothing in it was too crazy, esp. compared to the project!
   * I only added one model method, `average_student_age` for `Professor`
   ** Was wondering if I should have had others for sorting by name, instead of just calling `@professors = Professor.all.order(:name)` in the controller. I didn't do that though, because it seemed like it would be more complicated to define `@professors` in the controller after calling a model method to sort them.
   ** Was also kind of wondering if it's "proper" to call `average_student_age` on `@professor` from the view... would it be better to do this in the controller and pass an `@average_student_age` variable over to be used in the view? Again, I didn't do this because it seemed like it would be more complicated and not very SRP.
   * I did all my commits to main. Under non-IC circumstances I would have worked on different branches but for this I just wanted to focus on the code. Hope u aint mad!
   * Not an actual complaint, but I hate Harris Pottler and all his Dumledork Blifflepiff friends! ...sorry, just had to say that after staring at their names for 2 hrs. I feel better now!

# Hogwarts Again

## Setup instructions:
  - Fork this repo
  - `git clone <repo>`
  - `cd <repo_name>`
  - `bundle install`
  - `rails db:{create,migrate,seed}`

When you run rspec, you should have 12 failing tests to start.  

###  Overview

We will be creating an application to track Professors and Students at the Hogwarts School of Witchcraft and Wizardry from the Harry Potter book series (you do not need any knowledge of Harry Potter to complete this challenge). 

 
### User Stories
 
```
User Story 1 of 4
As a visitor,
When I visit '/professors',
I see a list of professors with the following information:
-Name
-Age
-Specialty
(e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
```
```
User Story 2 of 4
As a visitor,
When I visit '/professors/:id'
I see a list of the names of the students the professors have.
(e.g. "Neville Longbottom"
     "Hermione Granger"
     "Luna Lovegood")
```
```
User Story 3 of 4
As a visitor,
When I visit '/students'
I see a list of students and the number of professors each student has.
(e.g. "Draco Malfoy: 5"
     "Nymphadora Tonks: 10")
```
```
User Story 4 of 4
As a visitor,
When I visit '/professors/:id'
I see the average age of all students for that professor.
(e.g. "Average Age: 14.5")
```
---
### Extension
```
User Story Extension
On all index pages, all information is listed alphabetically.
	

