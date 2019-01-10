# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
linke = "!1m28!1m12!1m3!1d7284871.26887458!2d-2.1654441624671277!3d45.040702274889945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e1!4m5!1s0x12a49816718e30e5%3A0x44b0fb3d4f47660a!2sBarcelona%2C+Spain!3m2!1d41.3850639!2d2.1734035!4m5!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C+France!3m2!1d48.856614!2d2.3522219!5e1!3m2!1sen!2sjp!4v1546996687495"
t1 = Trip.create start:"123", end:"Koulu", length:600, elo:1500, link:linke
t2 = Trip.create start:"Sarajevo", end:"Vienna", length:600, elo:1500, link:linke
t3 = Trip.create start:"Katto", end:"Maanpinta", length:600, elo:1500, link:linke
t4 = Trip.create start:"Void", end:"Void", length:600, elo:1500, link:linke
