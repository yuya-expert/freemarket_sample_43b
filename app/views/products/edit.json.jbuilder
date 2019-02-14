json.array! @product do |product|
  json.id @product.id
  json.product.id @image.product_id
  json.image.id @image.id

end
