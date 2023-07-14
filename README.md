# セットアップ

## ビルド

```sh
docker compose build
```

### 参考 rails インストール時のコマンド

```sh
docker compose run backend rails new . --api -d=mysql --minimal -T
```

## ビルド後の DB 初期化

```sh
docker compose run --rm backend bundle install
docker compose run --rm backend bin/rails db:create db:migrate
```

## 起動

```sh
docker compose up -d
```

## 停止

```sh
docker compose down
```

## ログ

```sh
docker compose logs -f
```

## コンテナに入る

```sh
docker compose exec backend bash
```

## テスト

```sh
docker compose exec backend bin/rails test
```

## テストデータの投入

```sh
docker compose exec backend bin/rails db:seed
```
