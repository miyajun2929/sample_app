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
    # 詳細画面へリダイレクト
    # 引数の(list.id)を忘れないこと
    redirect_to todolist_path(list.id)
    # 3. トップ画面へリダイレクト
    # redirect_to '/top'（新規投稿後のリダイレクト先変更のため削除）
  end
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
    # データをfindメソッドを使ってデータベースから取得し、@listへ格納
  end
  def edit
    @list = List.find(params[:id])
  end

  private
  # ストロングパラメータ（セキリュティ対策/これより後に定義されたメソッドはアクションとして認識されない）
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
