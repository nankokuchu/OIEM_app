# README

# アプリ名
OIEM_app (Order Invoice Easy Management)

# 概要
フリマアプリ、メルカリなどで出品しているユーザーの商品ことにコスト管理、発注先管理、インボイスが簡単に生成できて、管理できる。

# 本番環境
未定

# 制作背景(意図)
ツージョブが一般的になっている現在、フリマアプリへの商品を出品して販売するのは、ハードルが低いため、簡単に副業として参加できる。出品している商品を増やすと商品の発注管理（どの商品はどこからいくらで仕入れしているか）、外国からの輸入の場合、インボイスも毎回作成しないといけない。こちらの作業を一つのアプリで管理できる。
- 商品登録する際に、仕入れ価格、送料を登録することで、コスト管理ができる
- 商品登録する際、仕入れ先を登録することで、再度発注する際に簡単に発注できる。
- 毎回の発注履歴が残り、いつ何を何個仕入れしているか確認できる。
- 海外からの仕入れの場合、簡単にインボイスが生成され、毎回生成されているインボイスがデータベースに保存されて、確認することができる。

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