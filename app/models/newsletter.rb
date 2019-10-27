class Newsletter < ApplicationRecord
  has_many :stories, dependent: :destroy,
                     before_remove: :lyra_destroy_stories_sync

  validates_uniqueness_of :release_date

  def lyra_destroy_stories_sync(story)
    return unless story.lyra_id

    MorningBrewLyra::Stories.destroy(story.lyra_id)
  end
end
