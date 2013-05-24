class Table < ActiveRecord::Base
  has_many :guests

  attr_accessible :name, :notes, :guest_ids, :x, :y, :table_type

  validates_presence_of :name
  validates_length_of :guests, :maximum => 8, :unless => Proc.new {|table| table.table_type == 'dance_floor' }
  validates_length_of :guests, :maximum => 0, :if => Proc.new {|table| table.table_type == 'dance_floor' }
end