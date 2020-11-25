class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # 1. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3. トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # データをfindメソッドを使ってデータベースから取得し、@listへ格納
  end

  private
  # ストロングパラメータ（セキリュティ対策/これより後に定義されたメソッドはアクションとして認識されない）
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
