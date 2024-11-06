class Current < ActiveSupport::CurrentAttributes # used for assigning things like the user / account / timezone - things related to the current request
    attribute :user
end
