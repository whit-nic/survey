json.array!(@provinces) do |province|
  json.extract! province, :id, :name
end
