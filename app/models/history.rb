class History < ApplicationRecord
  belongs_to :user
  belongs_to :projeto
  has_many :task
end
