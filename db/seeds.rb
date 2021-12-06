# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pr = State.new(name: "Paraná", shortname: "PR")
pr.cities.build([{name: "Curitiba", shortname: "CWB"}, {name: "Londrina", shortname: "LDB"}, {name: "Cascavel", shortname: "CAC"}])
pr.save!

sc = State.new(name: "Santa Catarina", shortname: "SC")
sc.cities.build([{name: "Florianópolis", shortname: "FLN"}, {name: "Joinville", shortname: "JOI"}, {name: "Chapecó", shortname: "XAP"}])
sc.save!

rs = State.new(name: "Rio Grande do Sul", shortname: "RS")
rs.cities.build([{name: "Porto Alegre", shortname: "POA"}, {name: "Santa Maria", shortname: "RIA"}, {name: "Caxias do Sul", shortname: "CXJ"}])
rs.save!