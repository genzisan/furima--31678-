require 'rails_helper'

RSpec.describe "ユーザーログイン,テストコード", type: :system do
  before do
    @user = FactoryBot.build(:user) 
  end
    
    it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること' do
      # トップページに移動す
      visit root_path
      # ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      
    end
end
