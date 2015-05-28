json.array!(@choices) do |choice|
  json.extract! choice, :id, :name, :question_id
  json.url choice_url(choice, format: :json)
end
