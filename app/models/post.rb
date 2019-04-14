class Post < ApplicationRecord
    belongs_to :user

    def is_short?
        return title == "" && body.length <= 200
    end
end
