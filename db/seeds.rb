# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
                      {
                        username: 'shao_kahn',
                        password: 'password',
                        firstname: 'Shao',
                        lastname: 'Kahn',
                        email: 'shao.kahn@admin.com',
                        role: 'admin',
                      },
                      {
                        username: 'johny_cage',
                        password: 'password',
                        firstname: 'Johny',
                        lastname: 'Cage',
                        email: 'johny.cage@mail.com',
                        role: 'user',
                      }
                    ]).index_by(&:username)

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile Development'},
                               { title: 'Big Data' },
                               { title: 'Machine Learning' }
                             ]).index_by(&:title)

tests = Test.create([
                      {
                        title: 'Ruby',
                        level: 1,
                        category: categories.fetch('Backend'),
                        author: users.fetch('shao_kahn')
                      },
                      {
                        title: 'Ruby on Rails',
                        level: 2,
                        category: categories.fetch('Backend'),
                        author: users.fetch('shao_kahn')
                      },
                      {
                        title: 'Swift',
                        level: 2,
                        category: categories.fetch('Mobile Development'),
                        author: users.fetch('johny_cage')
                      },
                      {
                        title: 'JavaScript',
                        level: 1,
                        category: categories.fetch('Frontend'),
                        author: users.fetch('johny_cage')
                      },
                      {
                        title: 'React/Redux',
                        level: 3,
                        category: categories.fetch('Frontend'),
                        author: users.fetch('johny_cage')
                      }
                    ]).index_by(&:title)

questions = [
  Question.new(
    body: 'What is the difference between calling super and calling super()?',
    test: tests.fetch('Ruby'),
    ),
  Question.new(
    body: 'Can you call a private method outside a Ruby class using its object?',
    test: tests.fetch('Ruby')
  ),
  Question.new(
    body: 'In Swift enumerations, what’s the difference between raw values and associated values?',
    test: tests.fetch('Swift')
  ),
  Question.new(
    body: 'What is NaN? What is its type? How can you reliably test if a value is equal to NaN?',
    test: tests.fetch('JavaScript')
  ),
  Question.new(
    body: 'What is JSX?',
    test: tests.fetch('React/Redux')
  )
]

questions.each do |question|
  question.answers << Answer.new(text: 'Yes', question: question, correct: true)
  question.answers << Answer.new(text: 'No', question: question)
  question.answers << Answer.new(text: 'Maybe', question: question)
  question.answers << Answer.new(text: 'I dunno', question: question)
  question.save!
end

TestPassage.create([
                     { user: users.fetch('johny_cage'), test: tests.fetch('Ruby') },
                     { user: users.fetch('johny_cage'), test: tests.fetch('Ruby on Rails') }
                   ])
