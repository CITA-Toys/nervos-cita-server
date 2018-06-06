class PageInfo < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :locale }
  validates :locale, presence: true
  validates :content, presence: true
end
