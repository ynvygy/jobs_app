class Job < ActiveRecord::Base
  belongs_to :company, :category
  has_many :skills
end