json.array! @brands do |brand|
  json.list brand.list
  json.id   brand.id
end
