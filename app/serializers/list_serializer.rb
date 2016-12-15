# frozen_string_literal: true
#
class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :hidden, :items

  def items
    object.items.pluck(:id)
  end
end
