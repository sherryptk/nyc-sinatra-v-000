class Landmark <ActiveRecord::Base
  belongs_to :figure

  def slug
    slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    slug
    end
end
