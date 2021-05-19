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
### トップページ
[![Image from Gyazo](https://i.gyazo.com/6a598f9f077a4f88fe4a22c5488ee1cb.png)](https://gyazo.com/6a598f9f077a4f88fe4a22c5488ee1cb)
#### ログインしているユーザーのトップページには、
- 設定
- マイページ
- ログアウト
が表示されている

### 設定ページ
[![Image from Gyazo](https://i.gyazo.com/e9fe833a0509067012ea1a14acdb07d9.gif)](https://gyazo.com/e9fe833a0509067012ea1a14acdb07d9)
- ユーザーが毎に為替レートと国内発送方法の送料を設定することができる
- 設定した為替レートと国内送料は商品登録する際にコスト計算をする際に利用する

### マイページ
[![Image from Gyazo](https://i.gyazo.com/dbacd123d8aae47d893075254b8ded0d.png)](https://gyazo.com/dbacd123d8aae47d893075254b8ded0d)
#### マイページには、二つ部分に分かれている
- 共通操作パーネル (共通操作パネルは商品管理、発注管理、発送依頼管理ができる)
- 発注必要なリスト（商品アップする際に、商品発注基準値を設定することで、在庫数が基準値より少ない商品が表示される
）

### 商品管理パーネル
[![Image from Gyazo](https://i.gyazo.com/400c0ef4a53190f5bda5c1fd1942dde7.gif)](https://gyazo.com/400c0ef4a53190f5bda5c1fd1942dde7)
- 新規商品アップ
- 商品一覧（ユーザーがアップした全ての商品のうち、非表示に設定しない商品が表示される）
- 発注中商品一覧（現在発注している商品のみ表示される）
- 非表示商品一覧（ユーザーが商品を非表示にした商品のみ表示させれる）

### 新規商品登録
[![Image from Gyazo](https://i.gyazo.com/260bcb9a273b4b8c2d8398a0b2203832.gif)](https://gyazo.com/260bcb9a273b4b8c2d8398a0b2203832)
#### 商品をアップする際に、２回目以降の商品仕入れが簡単にするためのメーカー情報の記入と商品あたりコストをもっと把握しやすいように工夫した
- 商品インボイス作成用の基本情報
- 商品重量（商品コスト計算する際に利用すする）
- メーカー価格（メーカーが販売している現地価格）
- 為替レート（ユーザーが設定した為替レット）
- 海外送料（管理者が提供している海外送料の運賃）
- 販売送料（ユーザーが設定した国内送料）
#### 上記合計が商品の仕入れ価格になる
- 販売手数料（販売手数料を設定する）
- 販売利益（販売価格-仕入れ価格-手数料）
- 販売利益率（販売利益を〇〇％にすると目標値を設定する際に利用することができる）

### 商品発注
[![Image from Gyazo](https://i.gyazo.com/9ab3c7f001f09d67aec08b7a7f6ce05f.png)](https://gyazo.com/9ab3c7f001f09d67aec08b7a7f6ce05f)
#### 商品を発注する際に商品一覧ページから発注を行う
- 仕入商品購入ページを押すとメーカーの販売ページに遷移する

### 新規発注
[![Image from Gyazo](https://i.gyazo.com/8a7019fbd5e72bdae088dbaa6af82b4b.png)](https://gyazo.com/8a7019fbd5e72bdae088dbaa6af82b4b)
#### ユーザーが発注した全ての個別の発注が表示される
[![Image from Gyazo](https://i.gyazo.com/8a7019fbd5e72bdae088dbaa6af82b4b.png)](https://gyazo.com/8a7019fbd5e72bdae088dbaa6af82b4b)

### 追跡番号登録
[![Image from Gyazo](https://i.gyazo.com/990f375b533824cec8935610d3e804aa.gif)](https://gyazo.com/990f375b533824cec8935610d3e804aa)
#### 発注した貨物が倉庫に到着しているかを確認するため、追跡番号を登録を行う

### 管理者側
[![Image from Gyazo](https://i.gyazo.com/3ad3000f0535b15c58c7bd2f157ae28d.gif)](https://gyazo.com/3ad3000f0535b15c58c7bd2f157ae28d)
#### ユーザーが登録した発注は管理者側の新規貨物一覧に表示される

### 管理者側ー追跡番号登録（倉庫側）
[![Image from Gyazo](https://i.gyazo.com/ab51c87aade8b09a3b5bb4a957e94f2a.gif)](https://gyazo.com/ab51c87aade8b09a3b5bb4a957e94f2a)
####　倉庫側では、届いている貨物の追跡番号と貨物の重量を登録する

### ユーザーへのお知らせ
[![Image from Gyazo](https://i.gyazo.com/8da8b74967cf569a32bb88c911e76aab.gif)](https://gyazo.com/8da8b74967cf569a32bb88c911e76aab)
#### ユーザーが登録した追跡番号と倉庫で登録している追跡番号が一致すれば、管理者側でユーザーが送った貨物の重量を紐つけて、ユーザー側に貨物が到着しているのを教えらせる

### ユーザー側発送依頼をかける
[![Image from Gyazo](https://i.gyazo.com/b1aa478b4fff3d887266007b3d68dab9.gif)](https://gyazo.com/b1aa478b4fff3d887266007b3d68dab9)
####　管理者側で処理した発注は、ユーザー側の「倉庫に到着している貨物リスト」ページに表示されている
#### ユーザーは自身で貨物を選んで発送依頼をする

### 送料を支払う



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
- has_many :transportation_expense
- has_many :exchange_rate_set

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

## exchange_rate_set
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|exchange_country_id          |integer    |null: false       |
|rate                         |string     |null: false       |
|user                         |references |foreign_key: true |
### Association
- belongs_to :user

## transportation_expense
|Column                       |Type       |Options           |
|-----------------------------|-----------|------------------|
|name                         |string     |null: false       |
|price                        |integer    |null: false       |
|user                         |references |foreign_key: true |
### Association
- belongs_to :user