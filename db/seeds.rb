chilean_cities = [
  "Santiago",
  "Valparaíso",
  "Concepción",
  "La Serena",
  "Antofagasta",
  "Viña del Mar",
  "Puerto Montt",
  "Temuco",
  "Iquique",
  "Arica",
  "Punta Arenas",
  "Calama",
  "Valdivia",
  "Coquimbo"
]

chilean_cities.each do |city_name|
  City.create(name: city_name)
end

10.times do 
  user = User.new(
    :email                 => Faker::Internet.email,
    :password              => "123456",
    :password_confirmation => "123456"
  )
  user.save!
end

user = User.new(
  :email                 => 'admin@admin.com',
  :password              => "123456",
  :password_confirmation => "123456",
  :role => 'admin'
)
user.save!

material = Material.new(  :name => 'Turbine')
material.save!
material = Material.new(  :name => 'Ignition System')
material.save!
material = Material.new(  :name => 'Fuel System')
material.save!

40.times do
  motor = Motor.new(
    motor_class: Motor.motor_classes.keys.sample,
    description: Faker::Lorem.characters(number: 10)
    # main_image: Faker::LoremFlickr.image(size: "300x200", search_terms: ['engine']) 
  )

  motor.save!
end