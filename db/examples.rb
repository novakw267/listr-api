Item.delete_all
List.delete_all

favorites = List.create!({ title: 'Favorite Things' })
todo = List.create!({ title: 'Todo' })

Item.create!([
  { content: 'Cats', list: favorites },
  { content: 'Star Wars', list: favorites },
  { content: 'Coffee', list: favorites },
  { content: 'Keith Hulu', list: favorites },
  { content: 'Sleep', list: favorites },
  
  { content: 'Build an API', list: todo },
  { content: 'Sleep', list: todo }
])
