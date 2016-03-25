class Room < ActiveRecord::Base
  validates_presence_of :name

  has_many :tables, dependent: :destroy
  belongs_to :game
  belongs_to :host, foreign_type: :host_id, class_name: User
end
