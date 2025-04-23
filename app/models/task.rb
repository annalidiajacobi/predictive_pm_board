class Task < ApplicationRecord
  belongs_to :list
  belongs_to :project
  has_many :task_histories, dependent: :destroy

  def move_to_list(new_list)
    TaskHistory.create!(task: self, from_list: self.list, to_list: new_list)
    update(list: new_list)
  end
end