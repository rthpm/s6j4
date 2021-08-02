class Tag < ApplicationRecord
  belongs_to :tags_gossips_connection, required: false
  has_many :gossips, through: :tags_gossips_connection
end
