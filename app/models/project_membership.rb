class ProjectMembership < ApplicationRecord
  # THE RAILS BUILT-IN ENUM DOES NOT WORK HERE???
  belongs_to :user
  belongs_to :project


  # enum role: [ :owner, :collaborator, :viewer ]

  ROLES = { owner: 0, collaborator: 1, viewer: 2 }

  def role
    ROLES.key(read_attribute(:role))
  end

  def role=(value)
    write_attribute(:role, ROLES[value.to_sym])
  end

  def owner?
    role == :owner
  end
end
