class Todo < ActiveRecord::Base
    validates :text, presence: true, length: { minimum: 1 }

end
