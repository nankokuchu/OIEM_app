crumb :root do
  link "Home", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :orders do
  link "発注一覧ページ", orders_path
  parent :mypage
end

crumb :tracking do
  link "追跡番号未登録発注一覧ページ", tracking_orders_path
  parent :orders
end

crumb :processing do
  link "倉庫に到着済発注一覧ページ", processing_orders_path
  parent :orders
end

crumb :sent do
  link "海外倉庫発送済み一覧ページ", sent_orders_path
  parent :orders
end

crumb :processed do
  link "処理済発注一覧ページ", processed_orders_path
  parent :orders
end

crumb :cancel do
  link "キャンセル済発注一覧ページ", cancel_orders_path
  parent :orders
end

crumb :items do
  link "商品一覧ページ", items_path
  parent :mypage
end

crumb :new_item do
  link "商品新規登録ページ", new_item_path
  parent :mypage
end