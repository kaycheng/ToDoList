class List < ApplicationRecord

  has_many :todo_items
  validates_presence_of :name, :duedate, :note
end
