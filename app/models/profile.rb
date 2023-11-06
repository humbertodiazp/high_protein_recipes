class Profile < ApplicationRecord
  belongs_to :user
  validates :name , presence: true
  has_one_attached :image 

  after_create :set_color

  def set_color
    self.color = color_list.sample
    save
  end

  def color_list
    %w[red orange yellow green cyan lightblue darkblue purple pink]
  end

end
