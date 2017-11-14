class Wiki < ActiveRecord::Base
  has_many :collaborators
  belongs_to :user 
  has_many :users, through: :collaborators
  accepts_nested_attributes_for :collaborators
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  
  def collaborators
    Collaborator.where(wiki_id: id)
  end
  
  def users
    collaborators.users
  end


end
