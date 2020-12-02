require 'rails_helper'

RSpec.describe '商品出品機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item_text = Faker::Lorem.sentence
    @item_image = Faker::Lorem.sentence
  end
  context '商品出品ができるとき'do
    it 'ログインしたユーザーは商品出品できる' do
      # ログインする
      # 新規投稿ページへのリンクがあることを確認する
      # 出品ページに移動する
      # フォームに情報を入力する
      # 送信するとItemモデルのカウントが1上がることを確認する
      # トップページに遷移する
      # トップページには先ほど投稿した内容のアイテムが存在することを確認する（画像）
      # トップページには先ほど投稿した内容のアイテムが存在することを確認する（テキスト）
    end
  end
  context '商品出品ができないとき'do
    it 'ログインしていないと商品出品ページに遷移できない' do
      # トップページに遷移する
      # 新規投稿ページへのリンクがない
    end
  end
end
