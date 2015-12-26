# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Review.create(user_id: 1, center_id: 1, rate: 4.5, title: "Estupendo", comment: "cualquier cosa")
User.create email: "test@test.com", username: "test", name: "test", password: "testtest", password_confirmation: "testtest"
Center.create name: "Centro Deportivo Las rehoyas", address: "parque de las rehoyas", phone: "928202122",
              description: "Estupendísimo", main_image: "rehoyas_1.jpg",
              monday_friday: "7:30-22:30", saturday: "7:30-18:00", sunday: "cerrado",
              latitude: "28.1084143", longitude: "-15.4294968", email: "info@lasrehoyas.com", rate: 4.5, images: "rehoyas_2.jpg&rehoyas_3.jpg"
Center.create name: "Centro Deportivo Pedro Hidalgo", address: "Carretera de pedro hidalgo", phone: "928202123",
              description: "Estupendísimo", main_image: "hidalgo_1.jpg",
              monday_friday: "7:30-22:30", saturday: "7:30-18:00", sunday: "cerrado",
              latitude: "28.0619663", longitude: "-15.423471", email: "info@hidalgo.com", rate: 3.2, images: "hidalgo_2.jpg"