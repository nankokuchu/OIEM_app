# README

# アプリ名
OIEM_app (Order Invoice Easy Management)

# 概要
- 商品毎にコスト管理、発注先管理、インボイスが簡単に生成できる
- 中国からの物流を利用する前提で、ユーザーは倉庫に到着している荷物を選んで発送依頼をかけることができる

# 本番環境
### https://oiem-app-5115.herokuapp.com/
- ID: zzazz
- PASS: 5115

### ログイン情報(テスト用)
- ユーザーID：test1@test.com
- ユーザーPS：123456a
- 管理者ID：manage@test.com
- 管理者PS：123456a

# 制作背景(意図)
楽天などのECサイトに出品している店舗は扱っている商品数が多く、且つ商品により仕入れ先が違うため、商品別に仕入れ先をメモして保存しないといけない。海外からの仕入れの場合、毎回インボイスを制作する手間も生じる。ECサイトの運営している発注者の視点から発注の流れを見ると

- 販売しようとする商品を決める
- 商品を仕入れする
- 商品をアップして販売する
- 在庫チェック
- 商品を再入荷する（＝仕入れ）

という流れとなっている。商品の仕入れは繰り返しで発生することであり、仕入れする際の手間を確認すると

商品を仕入れする際に生じること
- コスト計算（毎回仕入れする際の価格を必ずしも前回と同じではない）
- 商品毎に仕入れ先を決めて、保管する（前回仕入れし先を調べる）
- いつ何を何個仕入れしているかをメモする
- 海外からの仕入れの場合毎回インボイスも作成する

上記仕入れする際に生じることを一つのアプリで管理できるようにするため、アプリを作成した。

# DEMO

# 工夫したポイント
- コストと利益の計算
商品を一つ販売されている際、どれぐらいの利益を得られるかを明確にする。
- 売れている商品の再仕入れ
商品ことに仕入れラインを設置して、仕入れラインの在庫数を切れるとマイページで表示される
- 商品ことの仕入れ個数が確認できる
- 商品登録-発注-貨物到着チェック-到着している貨物発送依頼-手元に届くまでの一連の流れを完成すること


# DB設計
## users

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|email               |sting  |null: false, unique: true|
|encrypted_password  |sting  |null: false              |
|nickname            |sting  |null: false              |
|first_name          |sting  |null: false              |
|last_name           |sting  |null: false              |
|first_name_reading  |sting  |null: false              |
|last_name_reading   |sting  |null: false              |
|birthday            |date   |null: false              |
### Association
- has_many :items
- has_many :orders
- has_many :kaigai_orders
- has_many :kaigai_order_cansels
- has_many :kaigai_order_pays
- has_many :invoices

## items
|Column                     |Type       |Options           |
|---------------------------|-----------|------------------|
|eng_name                   |string     |null: false       |
|jp_name                    |string     |null: false       |
|jp_material                |string     |null: false       |
|eng_material               |string     |null: false       |
|manufacture_name           |string     |null: false       |
|item_selection             |string     |null: false       |
|manufacture_item_selection |string     |null: false       |
|manufacture_url            |string     |null: false       |
|selling_price              |integer    |null: false       |
|purchase_price             |integer    |null: false       |
|ppurchase_price            |integer    |null: false       |
|stock_quantity             |integer    |null: false       |
|order_status_id            |integer    |null: false       |
|items_status_id            |integer    |null: false       |
|stock_standard             |string     |null: false       |
|weight                     |string     |null: false       |
|user                       |references |foreign_key: true |
### Association
-  belongs_to :user
- has_many :orders
- has_one_attached :image
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :items_status
- belongs_to :order_status

## orders
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|order_name                   |string     |null: false       |
|item_price                   |integer    |null: false       |
|total_price                  |integer    |null: false       |
|quantity                     |integer    |null: false       |
|order_number                 |string     |null: false       |
|invoice_status_id            |integer    |null: false       |
|arrival_status_id |string    |integer    |null: false       |
|manufacture_url              |string     |null: false       |
|item                         |reference  |foreign_key: true |
|user                         |references |foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :manage
- has_one :order_cancel
- has_one :tracking_number
- has_one :order_invoice
- has_many :order_kaigai_orders
- has_many :kaigai_orders, through: :order_kaigai_orders
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :invoice_status
- belongs_to :arrival_status

## tracking_numbers
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|number                       |string     |null: false       |
|order                        |references |foreign_key: true |
### Association
- belongs_to :order

## manages
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|order_tracking_number        |string     |null: false       |
|order_weight                 |string    |null: false       |
|order                        |references |foreign_key: true |
### Association
- belongs_to :order

## infos
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|info_order_tracking_number   |string     |null: false       |
|info_order_weight            |string     |null: false       |

## kaigai_orders
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|kaigai_order_name            |string     |null: false       |
|kaigai_order_weight          |string     |null: false       |
|kaigai_order_price           |integer    |null: false       |
|user                         |references |foreign_key: true |
### Association
-　belongs_to :user
- has_one :invoice
- has_one :kaigai_tracking
- has_one :kaigai_order_over
- has_one :kaigai_order_cancel
- has_one :kaigai_order_pay
- has_many :order_kaigai_orders
- has_many :orders, through: :order_kaigai_orders

## order_kaigai_orders
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|order                        |references |foreign_key: true |
|kaigai_order                 |references |foreign_key: true |
### Association
- belongs_to :order
- belongs_to :kaigai_order

## kaigai_order_cancels
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|kaigai_order                 |references |foreign_key: true |
|user                         |references |foreign_key: true |
### Association
- belongs_to :user
- belongs_to :kaigai_order

## kaigai_order_pays
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|kaigai_order                 |references |foreign_key: true |
|user                         |references |foreign_key: true |
### Association
- belongs_to :user
- belongs_to :kaigai_order

## addresses
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|postal_code                  |string     |null: false       |
|prefecture_id                |integer    |null: false       |
|city                         |string     |null: false       |
|house_number                 |string     |null: false       |
|building_name                |string     |null: false       |
|phone_number                 |string     |null: false       |
|kaigai_order_pay             |references |foreign_key: true |
### Association
- belongs_to :kaigai_order_pay

## invoices
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|invoice_name                 |string     |null: false       |
|kaigai_order                 |references |foreign_key: true |
|user                         |references |foreign_key: true |
### Association
- belongs_to :user
- belongs_to :kaigai_order

## kaigai_trackings
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|number                       |string     |null: false       |
|kaigai_order                 |references |foreign_key: true |
### Association
- belongs_to :kaigai_order

## kaigai_order_overs
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|kaigai_order                 |references |foreign_key: true |
### Association
- belongs_to :kaigai_order

## order_cancels
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|kaigai_order                 |references |foreign_key: true |
### Association
- belongs_to :kaigai_order

## order_invoices
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|order_invoice_item_name      |string     |null: false       |
|order_invoice_item_price     |integer    |null: false       |
|order_invoice_item_material  |string     |null: false       |
|order_invoice_item_quantity  |integer    |null: false       |
|order                        |references |foreign_key: true |
### Association
- belongs_to :order
