class ProjectMembership < ApplicationRecord
  # THE RAILS BUILT-IN ENUM DOES NOT WORK HERE???
  belongs_to :user
  belongs_to :project


  # enum role: [ :owner, :collaborator, :viewer ]

  OWNER = 0
  COLLABORATOR = 1
  VIEWER = 2

  ROLES = { owner: OWNER, collaborator: COLLABORATOR, viewer: VIEWER }

  def role
    ROLES.key(read_attribute(:role)).to_s.titleize
  end

  def role=(value)
    write_attribute(:role, ROLES[value.to_sym])
  end

  def owner?
    role == :owner
  end
end
