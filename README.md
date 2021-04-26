# README

# アプリ名
OIEM_app (Order Invoice Easy Management)

# 概要
フリマアプリ、メルカリなどで出品しているユーザーの商品ことにコスト管理、発注先管理、インボイスが簡単に生成できて、中国からの物流を提供する。

# 本番環境
未定

# 制作背景(意図)
ツージョブが一般的になっている現在、メルカリなどに商品を出品して販売するのは、ハードルが低く、簡単に副業としてスタートできる。メルカリに商品を出品しているユーザー視点から見ると
- 販売しようとする商品を決める
- 商品を仕入れする
- 商品をアップして販売する
- 在庫チェック
- 商品を仕入れする
という流れとなっている。商品の仕入れは繰り返しで発生することであり、仕入れする際の手間を確認すると

商品を仕入れする際に生じること
- コスト計算（毎回仕入れする際の価格を必ずしも前回と同じではない）
- 商品ことに仕入れ先を決めて、保管する（前回仕入れし先を調べる）
- 海外からの仕入れの場合毎回インボイスも作成する

上記仕入れする際に生じることを一つのアプリで管理できるようにするため、アプリを作成した。中国のalibabaから仕入れする仮定でアプリを制作している。

# 工夫したポイント
- コストと利益の計算
商品を一つ販売されている際、どれぐらいの利益を得られるかを明確にする。
- 売れている商品の再仕入れ
商品ことに仕入れラインを設置して、仕入れラインの在庫数を切れるとマイページで表示される
- 商品ことの仕入れ個数が確認できる


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
|weight                     |string     |null: false       |
|user                       |references |foreign_key: true |
### Association
- belongs_to :user