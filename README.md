# setup

まずはクローンします
`git clone git@github.com:takuyamishima/ichioshi.git`

dbはpostgresqlなので必要であれば

`brew install postgresql`

install完了後 postgresqlを起動します。

`brew services start postgresql`

フロントエンドの資産はyarnで管理しているのでyarnも入れます

`brew install yarn`

yarnのインストール完了後、必要なパッケージをインストールします。

`yarn install`

必要なgemをインストール

`bundle install`

ichioshi用のdbをセットアップします

`rails db:setup`

# start

`rails s`


