# frozen_string_literal: true
lists = {
  'Whole Foods' => %w(Oranges Kale Coffee Peanut\ Butter\ Puffins),
  'Amazon' => %w(Batteries Socks Macbook\ Charger),
  'Play It Again Sports' => %w(Volleyball Skis Poles Ski\ Boots Hockey\ Skates)
}

lists.each do |title, items|
  list = List.find_or_create_by title: title
  items.each do |content|
    item = { content: content }
    list.items.create item unless list.items.exists? item
  end
end
