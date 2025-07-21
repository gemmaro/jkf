# jkf gem

jkf gemは[JSON棋譜フォーマット (JKF)][jkf]をRubyに移植したものです。
柿木形式（[棋譜ファイル KIF 形式][kakinoki]、KI2）、[CSA標準棋譜ファイル形式][csa]の構文解析とJKFへの変換、JKFからKIF, KI2, CSAへの変換に対応しています。

[csa]: http://www2.computer-shogi.org/protocol/record_v22.html
[jkf]: https://github.com/na2hiro/Kifu-for-JS/tree/master/packages/json-kifu-format
[kakinoki]: http://kakinoki.o.oo7.jp/kif_format.html

## インストール

アプリケーションにインストールする場合（[Bundler][bundler]を使用する場合）、`Gemfile`に以下のように記述してください。

[bundler]: https://bundler.io/

```ruby
gem 'jkf'
```

さらに`bundle`コマンドを実行することでインストールできます。

または、`gem install`コマンドを使って直接インストールもできます。

## 使い方

KIF, KI2, CSAそれぞれ構文解析器 {Jkf::Parser} と変換器 {Jkf::Converter} が用意してあります。

```ruby
kif_parser = Jkf::Parser::Kif.new
ki2_parser = Jkf::Parser::Ki2.new
csa_parser = Jkf::Parser::Csa.new
```

```ruby
kif_converter = Jkf::Converter::Kif.new
ki2_converter = Jkf::Converter::Ki2.new
csa_converter = Jkf::Converter::Csa.new
```

{Jkf::Parser::Base#parse} でJKFへの変換、 {Jkf::Converter::Base#convert} でJKFから各形式へ変換できます。

```ruby
jkf = kif_parser.parse(kif_str) #=> Hash
jkf = ki2_parser.parse(ki2_str) #=> Hash
jkf = csa_parser.parse(csa_str) #=> Hash
```

```ruby
kif = kif_converter.convert(jkf) #=> String
ki2 = ki2_converter.convert(jkf) #=> String
csa = csa_converter.convert(jkf) #=> String
```

## 貢献

バグレポートやプルリクエストは[リポジトリ][repo]でよろしくお願いします。

[repo]: https://sourceforge.net/p/ruby-jkf/code/

Guixで開発されている場合は`guix shell`で`rake test`によるテスト実行ができます。

翻訳はドキュメントとAPIの2種類があります。
APIについてはRDocの国際化の機能を使います。
POTファイルの生成には`rdoc --format pot`とします。
これにより`doc/rdoc.pot`が生成されます。
このPOTファイルから各言語のPOファイルを初期化できます。
例えば`msginit -i doc/rdoc.pot -o po/en.rdoc.po --locale en_US.UTF-8`です。

## 謝辞

このプロジェクトは[GitHubのiyuuya/jkf](https://github.com/iyuuya/jkf)を元にしています。
そこから[GitHubのgemmaro/jkf](https://github.com/gemmaro/jkf)にフォークされました。
現在の開発は[SourceForgeのjkf](https://sourceforge.net/projects/ruby-jkf/)に移っています。

## 利用許諾

ライセンスは[MIT License][mit]です。

[mit]: http://opensource.org/licenses/MIT
