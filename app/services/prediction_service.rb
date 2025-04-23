class PredictionService
  def self.predict_next_action(project)
    to_do_list = project.lists.find_by(name: "To Do")
    in_progress_list = project.lists.find_by(name: "In Progress")

    to_do_has_many_tasks = to_do_list&.tasks&.count.to_i > 3
    in_progress_is_empty = in_progress_list.nil? || in_progress_list&.tasks&.empty?

    if to_do_has_many_tasks && in_progress_is_empty
      "Consider moving tasks from 'To Do' to 'In Progress'."
    else
      nil # No prediction for now
    end
  end
end
