json.extract! history, :id, :name, :user_id, :projeto_id, :status, :description, :points, :finished_at, :deadline, :created_at, :updated_at
json.url history_url(history, format: :json)
