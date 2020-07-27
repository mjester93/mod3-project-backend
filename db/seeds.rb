# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Platform.destroy_all
Game.destroy_all

10.times do 
    platform = Platform.create(name: Faker::Game.unique.platform)

    10.times do
        Game.create(
            name: Faker::Game.unique.title,
            genre: Faker::Game.genre,
            storyline: Faker::Quote.famous_last_words,
            summary: Faker::Quote.yoda,
            first_release_date: Faker::Date.in_date_period,
            platform: platform
        )
    end
end

