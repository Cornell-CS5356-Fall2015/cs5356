json.array!(@gadgets) do |gadget|
  json.extract! gadget, :id, :name, :widget_id
  json.url gadget_url(gadget, format: :json)
end
