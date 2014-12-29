# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Shift.destroy_all

user = User.find(2)

week = DateTime.now.beginning_of_week.all_week.to_a

Shift.create(user_id: user.id, shift_date: week[0], shift_time: 4)
Shift.create(user_id: user.id, shift_date: week[1], shift_time: 3)
Shift.create(user_id: user.id, shift_date: week[2], shift_time: 6)
Shift.create(user_id: user.id, shift_date: week[3], shift_time: 5, notes: "bar")
Shift.create(user_id: user.id, shift_date: week[4], shift_time: 3)
Shift.create(user_id: user.id, shift_date: week[5], shift_time: 5)
Shift.create(user_id: user.id, shift_date: week[6], shift_time: 11)
