user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')

card = user.punchcards.create(name: 'Boxing', description: 'Lala', icon: 'car')

card.records.create(date: Date.today, hours: 1, description: 'blah blah')
card.records.create(date: Date.today - 1, hours: 2.0, description: 'blah blah')
card.records.create(date: Date.today - 2, hours: 5, description: 'blah blah')
card.records.create(date: Date.today - 3, hours: 0.5, description: 'blah blah')