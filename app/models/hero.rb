class Hero < ApplicationRecord
    validates :name, :token, presence: true

    scope :by_token, ->(token) { where(token: token)}
    scope :sorted_by_name, -> { order(:name) }
    scope :search, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
end
