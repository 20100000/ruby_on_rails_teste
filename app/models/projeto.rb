class Projeto < ApplicationRecord
  belongs_to :user
  has_many :history
end
