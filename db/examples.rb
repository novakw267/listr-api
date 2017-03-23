# frozen_string_literal: true
lists = {
  'Favorite Things' => %w(Cats Star\ Wars Coffee Keith\ Hulu Sleep),
  'Todo' => %w(Build\ an\ API Sleep)
}

lists.each do |title, items|
  list = List.find_or_create_by title: title
  items.each do |content|
    item = { content: content }
    list.items.create item unless list.items.exists? item
    Store.find_or_create_by(name: 'Workshop Town', list_id: list.id)
  end
end
