class Hero < ApplicationRecord
    validates :name, presence: true

    scope :sorted_by_name, -> { order(:name) }
    scope :search, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
end
