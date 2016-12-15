# frozen_string_literal: true
#
class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :done, :list

  def list
    object.list.id
  end
end
