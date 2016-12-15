# frozen_string_literal: true
class AddListIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :list, index: true, foreign_key: true
  end
end
