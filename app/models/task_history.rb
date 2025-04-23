class TaskHistory < ApplicationRecord
  belongs_to :task
  belongs_to :from_list
  belongs_to :to_list
end
