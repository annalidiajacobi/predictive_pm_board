# README

* Ruby version: 3.4.3
* System dependencies: SQLite3
* Configuration: No specific configuration needed beyond standard Rails setup.
* Database creation: `rails db:migrate`
* Database initialization: No specific initialization beyond migrations.
* How to run the test suite: No tests implemented at this stage.
* Services (job queues, cache servers, search engines, etc.): None used.
* Deployment instructions: Standard Rails deployment.
* ...

## Predictive Project Management Board

This is a small project management board application built with Ruby on Rails. It allows users to create projects, organize them into lists (similar to columns on a board), and add tasks to those lists.

### Prediction Logic

The application includes a simple prediction rule to suggest the next action on a project:

**Rule:** If a project has a list named "To Do" containing more than 3 tasks and no tasks in a list named "In Progress", the system will display the suggestion: "Consider moving tasks from 'To Do' to 'In Progress'."

**How it works:**

1.  The `ProjectsController`'s `show` action calls the `PredictionService` to get a prediction for the current project.
2.  The `PredictionService`'s `predict_next_action` method:
    * Finds the "To Do" and "In Progress" lists associated with the project (if they exist).
    * Checks if the "To Do" list has more than 3 tasks and if the "In Progress" list either doesn't exist or has no tasks.
    * If these conditions are met, it returns the prediction string.
    * Otherwise, it returns `nil`.
3.  The `app/views/projects/show.html.erb` view then displays the prediction within a styled `div` if the `@prediction` instance variable (set by the controller) is present (not `nil`).

This simple rule provides a basic example of how a predictive system could be integrated into a project management tool to guide users on potential next steps.# predictive_pm_board
