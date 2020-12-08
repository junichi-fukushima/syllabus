# Rubyをインストール
FROM ruby:2.6.5

# 必要なパッケージをインストール
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# 公式では以下のコマンドを推奨しているが、nodeのバージョンが低くBootstrapが使えない
# RUN apt-get update -qq && apt-get install -y nodejs

# 環境変数を設定
ENV APP_HOME /app

# ディレクトリの作成と移動
WORKDIR $APP_HOME

# ホストのGemfileなどをコンテナへコピー
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

# BundlerでGemをインストール
RUN gem install bundler
RUN bundle install
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

# Railsアプリを作成（新規でアプリを作成する場合のみ）
RUN rails new . --database=mysql

# DBの設定ファイル書き換え（新規でアプリを作成する場合のみ）
COPY ./config $APP_HOME/config

# 3000番ポート解放
EXPOSE 3000

# コンテナ起動時にRailsサーバを起動
CMD ["rails", "server", "-b", "0.0.0.0"]