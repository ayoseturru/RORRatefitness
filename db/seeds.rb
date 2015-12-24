# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create email: "test@test.com", username: "test", name: "test", password: "testtest", password_confirmation: "testtest"
Center.create name: "Centro Deportivo las rehoyas", address: "parque de las rehoyas", phone: "928202122",
              description: "Estupendísimo",
              schedule: "Lunes a viernes: 7:30-22:30&Sábado: 7:30-18:00&Domingo: cerrado",
              latitude: "28.1084143", longitude: "-15.4294968", email: "info@lasrehoyas.com"
Center.create name: "Centro Deportivo Tamaraceite", address: "parque de las rehoyas", phone: "928202122",
              description: "Estupendísimo",
              schedule: "Lunes a viernes: 7:30-22:30&Sábado: 7:30-18:00&Domingo: cerrado",
              latitude: "28.1084143", longitude: "-15.4294968", email: "info@lasrehoyas.com"
Center.create name: "Centro Deportivo Pedro Hidalgo", address: "parque de las rehoyas", phone: "928202122",
              description: "Estupendísimo",
              schedule: "Lunes a viernes: 7:30-22:30&Sábado: 7:30-18:00&Domingo: cerrado",
              latitude: "28.1084143", longitude: "-15.4294968", email: "info@lasrehoyas.com"