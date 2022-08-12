# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

picard = FactoryBot.create(:user, email: 'picard@gmail.com', first_name: 'Jean Luc', last_name: 'Picard', password: '123456', password_confirmation: '123456',  admin: true)
FactoryBot.create(:user, email: 'riker@gmail.com', first_name: 'William', last_name: 'Riker', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'laforge@gmail.com', first_name: 'Geordi', last_name: 'La Forge', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'yar@gmail.com', first_name: 'Tasha', last_name: 'yar', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'worf@gmail.com', first_name: 'Worf', last_name: 'Klingon', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'b.crusher@gmail.com', first_name: 'Beverly', last_name: 'Cruser', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'troi@gmail.com', first_name: 'Deanna', last_name: 'Troi', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'data@gmail.com', first_name: 'Data', last_name: 'Soong', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'w.crusher@gmail.com', first_name: 'Wesley', last_name: 'Crusher', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'obrien@gmail.com', first_name: 'Miles', last_name: "O'brien", password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'lore@gmail.com', first_name: 'Lore', last_name: 'Soong', password: '123456', password_confirmation: '123456')
FactoryBot.create(:user, email: 'guinan@gmail.com', first_name: 'Guinan', last_name: 'ST', password: '123456', password_confirmation: '123456')