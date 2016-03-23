class Game < ActiveRecord::Base
  validates_presence_of :after_extra_turn_action, :extra_turns, :games_per_pairing, :host_id, :name, :rounds
  validates_inclusion_of :active, :use_game_clock, in: [true, false]

  before_save :default_values

  enum after_extra_turn_action: [:nothing, :tie, :both_lose]

  belongs_to :host, foreign_type: :host_id, class_name: User
  has_and_belongs_to_many :users
  private

  def default_values
    self.active = true if self.active.nil?
    self.after_extra_turn_action = 'none' if self.after_extra_turn_action.nil?
  end

end
