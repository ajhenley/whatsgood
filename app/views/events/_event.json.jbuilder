json.extract! event, :id, :what, :description, :when, :spots_id, :created_at, :updated_at
json.url event_url(event, format: :json)