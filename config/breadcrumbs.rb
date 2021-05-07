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

crumb :item_shiping_items do
  link "発注中商品一覧ページ", item_shiping_items_path
  parent :mypage
end

crumb :item_hidden_items do
  link "非表示商品一覧ページ", item_hidden_items_path
  parent :mypage
end

crumb :kaigai_new_kaigai_orders do
  link "新規発送依頼//支払い待ち一覧ページ", kaigai_new_kaigai_orders_path
  parent :mypage
end

crumb :kaigai_invoice_kaigai_orders do
  link "支払済/インボイス待ち一覧ページ", kaigai_invoice_kaigai_orders_path
  parent :mypage
end

crumb :kaigai_ship_kaigai_orders do
  link "海外発送待ち", kaigai_ship_kaigai_orders_path
  parent :mypage
end

crumb :kaigai_sent_kaigai_orders do
  link "処理済", kaigai_sent_kaigai_orders_path
  parent :mypage
end

crumb :kaigai_cancel_kaigai_orders do
  link "海外発送依頼キャンセル済", kaigai_cancel_kaigai_orders_path
  parent :mypage
end