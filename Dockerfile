FROM ruby:3.4.4-slim-bookworm

## 必要なパッケージをインストール
RUN apt update -qq && apt install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libyaml-dev

# 作業ディレクトリを設定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock ./

# Bundlerをインストールし、依存関係をインストール
RUN gem install bundler:2.6.9
RUN bundle install --jobs=$(nproc) --retry=3

# アプリケーションコードをコピー
COPY . .

# エントリーポイント
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]

# ポートを公開
EXPOSE 3000
