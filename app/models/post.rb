class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-fiction'] }

    validate :clickbait

    title_allow = title.include?("Won\'t Believe","Secret", "Top [number]", "Guess" )
        def clickbait
           if title_allow
                render Post
            else
                render Post.errors.full_messages
            end
        end
end
