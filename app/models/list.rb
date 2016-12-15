# frozen_string_literal: true
#
class List < ActiveRecord::Base
  has_many :items
end
