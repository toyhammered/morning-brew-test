class Story < ApplicationRecord
  belongs_to :newsletter

  validates_presence_of :title, :tag, :body
end
