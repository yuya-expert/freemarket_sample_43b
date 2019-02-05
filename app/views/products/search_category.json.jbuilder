json.array! @child_categories do |child_category|
  json.name    child_category[0]  # name
  json.id      child_category[1]  # id
end
