class Project < ApplicationRecord
  belongs_to :user  # The creator of the project
  has_many :project_memberships
  has_many :members, through: :project_memberships, source: :user

  validates :name, presence: true
end
