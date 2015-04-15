json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :title, :user_id, :payment_description, :category, :runner_id
  json.url task_url(task, format: :json)
end
