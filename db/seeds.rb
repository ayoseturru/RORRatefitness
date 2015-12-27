# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Review.create(user_id: 1, center_id: 1, rate: 4.5, title: "Estupendo", comment: "cualquier cosa")
Review.create(user_id: 2, center_id: 1, rate: 0.0, title: "Estupendo", comment: "cualquier cosa")

User.create email: "test@test.com", username: "test", name: "test", password: "testtest", password_confirmation: "testtest", municipality: "las palmas de gran canaria"
User.create email: "test2@test.com", username: "test2", name: "test", password: "testtest", password_confirmation: "testtest", municipality: "telde"

Center.create name: "Centro Deportivo Las rehoyas", address: "parque de las rehoyas", phone: "928202122",
              description: "Estupendísimo", main_image: "rehoyas_1.jpg",
              monday_friday: "7:30-22:30", saturday: "7:30-18:00", sunday: "cerrado",
              latitude: "28.1084143", longitude: "-15.4294968", email: "info@lasrehoyas.com", rate: 4.5,
              images: "rehoyas_2.jpg&rehoyas_3.jpg", municipality: "las palmas de gran canaria", price: "medium", aerobic: "1", fitness: "0",
              aquagym: "0", zumba: "0", tennis: "0"

Center.create name: "Centro Deportivo Pedro Hidalgo", address: "Carretera de pedro hidalgo", phone: "928202123",
              description: "Estupendísimo", main_image: "hidalgo_1.jpg",
              monday_friday: "7:30-22:30", saturday: "7:30-18:00", sunday: "cerrado",
              latitude: "28.0619663", longitude: "-15.423471", email: "info@hidalgo.com", rate: 3.2, images: "hidalgo_2.jpg",
              municipality: "telde", price: "medium", aerobic: "0", fitness: "0",
              aquagym: "0", zumba: "0", tennis: "1"

Advert.create(title: "mi anuncio", description: "quedada parque romano", user_id: 1)
