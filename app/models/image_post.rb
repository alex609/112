class ImagePost < ActiveRecord::Base
    has_attached_file :image, styles: {medium: "250x250>", thumb: "100x100>"}

    belongs_to :news_post

    validates_attachment :image, content_type: {content_type: /\Aimage\/.*\z/}

end
