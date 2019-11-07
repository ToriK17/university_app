# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Course.create!([
  {num: 101 , name: "Spanish 101", department: "Spanish"}, 
  {num: 100, name: "Introduction to Film", department: "Film"}, 
  {num: 470, name: "Social Psychology", department: "Psychology"}, 
  {num: 733, name: "Advanced Criminal Law", department: "Criminology"},
  {num: 120, name: "Football, Feminism and You", department: "Anthropology"},
  {num: 100, name: "Introduction to Statistics", department: "Statistics"},
  {num: 220 , name: "Environmental Science", department: "Geology"},
  {num: 410 , name: "Romantic Expressionism", department: "Art"},
  {num: 240 , name: "Investigative Journalism", department: "Journalism"},
  {num: 240 , name: "Communication Studies", department: "Communication"},
  {num: 107 , name: "Basic Genealogy", department: "Biology"},
  {num: 107 , name: "Beginner Pottery", department: "Art"},
  {num: 107 , name: "The Science of Illusion", department: "Magic"},
  {num: 107 , name: "Contemporary American Poultry", department: "Magic"},
  {num: 107 , name: "Ladders", department: "Psychology"},
  {num: 107 , name: "The Art of Discourse", department: "Communication"},
  {num: 102 , name: "English as a Second Language", department: "Spanish"},
  {num: 101 , name: "Beginner Anthropology", department: "Anthropology"},
  {num: 107 , name: "Accounting for Lawyers", department: "Accounting"},
  {num: 101 , name: "Basic Rocket Science", department: "Mechanical Engineering"},
  {num: 101 , name: "Myths and Ancient Peoples", department: "Theology"},
  {num: 101 , name: "Epidemiology", department: "janitorial"},
  {num: 107 , name: "Learning!", department: "Studies"},
  {num: 107 , name: "Conspiracy Theories and Interior Design", department: "Interior Design"},
  {num: 212 , name: "Celebrity Pharmacology", department: "Pharmacology"},
  {num: 212 , name: "Advanced Dungeons & Dragons", department: "Magic"},
  {num: 212 , name: "Intermediate Documentary Filmmaking", department: "Film"},
  {num: 212 , name: "Competitive Wine Tasting", department: "Culinary Arts"},
  {num: 212 , name: "Biology 101", department: "Biology"}, 
  {num: 212 , name: "Remedial Chaos Theory", department: "Mathematics"},
  {num: 212 , name: "Intro to Knots", department: "Survival"}, 
  {num: 212 , name: "Intro to Teaching", department: "Education"},
  {num: 212 , name: "The Floor is Made of Lava", department: "Geothermal Escapism"},
  {num: 212 , name: "Lawnmower Maintenance and Postnatal Care", department: "Geothermal Escapism"},
  {num: 212 , name: "Basic Email Security", department: "Computer Science"}  
])

User.create!([
  {user_name: "Jeff_Winger", email: "j.winger@gmail.com", password_digest: "password"}, 
  {user_name: "TroyBarnes", email: "troyb@gmail.com", password_digest: "password"},
  {user_name: "Senor_Cheng", email: "senorcheng@gmail.com", password_digest: "password"},
  {user_name: "Shirley_Sandwhiches", email: "S.Bennet@gmail.com", password_digest: "password"},
  {user_name: "Annie_E", email: "j.winger@gmail.com", password_digest: "password"},
  {user_name: "AbedCoolFilms", email: "abed.n@gmail.com", password_digest: "password"},
  {user_name: "Star_Burns", email: "osbourne@gmail.com", password_digest: "password"},
  {user_name: "Star_Burns", email: "osbourne@gmail.com", password_digest: "password"},
  {user_name: "Pierce_Hawthorn", email: "hawthorn_wipes@gmail.com", password_digest: "password"}
])

Resource.create!([
  {name: "Book"}, 
  {name: "Midterm"}, 
  {name: "Final"},
  {name: "Notes"},

  {name: "Knowledge Nuggets"}
])


