# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TEST_PASSWORD = 'qwe123qwe'

account = Account.create!(
  email: 'karly@test.com',
  name: 'Karla Alvarez',
  username: "Karli bb",
  password: TEST_PASSWORD
)

author = Author.create!(
  name: "J. K. Rowling",
  country: "England",
  born: "1965",
  died: ""
)

publisher =Publisher.create!(
  name: "Bloomsbury Publishing",
  country: "England"
)


book_1 = Book.create!(
  title: "Harry Potter and the Philosopher's Stone",
  author_ids: author.id,
  genre: 1,
  publisher_id: publisher.id,
  release_year: "1997",
  description: "Harry Potter has been orphaned and lives in the home of his abominable uncles and the unbearable cousin Dudley. He feels very sad and lonely, until one day he receives a letter that will change his life forever. In it they tell him that he has been accepted as a student at the Hogwarts Inner College of Magic and Wizardry.",
  format_type: 1,
  length: "256",
  length_type: 1,
  isbn: "9788498388879"
)

book_2 = Book.create!(
title: "Harry Potter and the Chamber of secrets",
author_ids: author.id,
genre: 1,
publisher_id: publisher.id,
release_year: "1999",
description: "The summer of Harry Potter has included the worst birthday of his life, the dire warnings of a house elf named Dobby and the rescue of the Dursleys' house starring his friend Ron Weasley at the wheel of a flying magic car. Back at Hogwarts College of Witchcraft and Wizardry, where his sophomore year is about to begin, Harry hears strange whispers echoing through the empty hallways. And then the attacks begin and several students appear petrified ... Apparently, Dobby's sinister predictions are coming true ...",
format_type: 1,
length: "256",
length_type: 1,
isbn: "9788478884957"
)

book_3 = Book.create!(
  title: "Harry Potter and the Prisoner of Azkaban",
  author_ids: author.id,
  genre: 1,
  publisher_id: publisher.id,
  release_year: "2000",
  description: "Welcome to the night bus, emergency transport for the witcher left to his own devices. Raise your wand, get on board and we'll take you wherever you want.\nWhen the night bus breaks into a dark street and brakes loudly in front of Harry, a new course at Hogwarts begins for him, full of extraordinary events. Sirius Black, assassin and follower of Lord Voldemort, has escaped, and they say he is looking for Harry. In her first Divination class, Professor Trelawney sees an omen of death in the tea leaves in Harry's cup ... But perhaps most terrifying are the dementors who patrol the school gardens, able to sip your soul with his kiss ...",
  format_type: 1,
  length: "256",
  length_type: 1,
  isbn: "9788478885190"
)

