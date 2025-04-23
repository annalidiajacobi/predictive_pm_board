require 'acts_as_list'

class List < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy
  acts_as_list scope: :project # Enables easy ordering of lists within a project
end