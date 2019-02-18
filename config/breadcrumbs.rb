crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
end

crumb :destroy do |destroy|
  link "ログアウト", destroy_user_session_path
  parent :mypages
end

crumb :profile do |edit|
  link "プロフィール", edit
  parent :mypages
end

crumb :edit do |edit|
  link "本人情報の登録", edit
  parent :mypages
end

crumb :payments do |payments|
  link "支払い方法", payments_user_path
  parent :mypages
end

crumb :detail do |product|
  link "#{product.name}", detail_product_path
end

crumb :show do |product|
  link "#{product.name}", product_path
  parent :mypages
end
