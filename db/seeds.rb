# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
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
            ])

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile Development'},
                               { title: 'Big Data' },
                               { title: 'Machine Learning' }
                             ])

tests = Test.create([
                      { title: 'Ruby', level: 1, category: categories[1] },
                      { title: 'Ruby on Rails', level: 2, category: categories[1] },
                      { title: 'Swift', level: 2, category: categories[2] },
                      { title: 'JavaScript', level: 1, category: categories[0] },
                      { title: 'React/Redux', level: 3, category: categories[0] }
                    ])

questions = Question.create([
                              {
                                body: 'What is the difference between calling super and calling super()?',
                                test: tests[0]
                              },
                              {
                                body: 'Can you call a private method outside a Ruby class using its object?',
                                test: tests[0]
                              },
                              {
                                body: 'In Swift enumerations, what’s the difference between raw values and associated values?',
                                test: tests[2]
                              },
                              {
                                body: 'What is NaN? What is its type? How can you reliably test if a value is equal to NaN?',
                                test: tests[3]
                              },
                              {
                                body: 'What is JSX?',
                                test: tests[4]
                              }
                            ])

Answer.create([
                { text: 'Yes', question: questions[0] },
                { text: 'No', question: questions[1] },
                { text: 'Maybe', question: questions[2] },
                { text: 'I dunno', question: questions[3] }
              ])
