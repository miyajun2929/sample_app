class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # 1. データを新規登録するためのインスタンス作成（データベース保存用のインスタンス変数が設定される）
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
    @lists = List.all  #インスタンス変数を定義することで、すべての投稿データを取得するようListモデルへ指示
  end
  def show
    @list = List.find(params[:id])
    # データをfindメソッドを使ってデータベースから取得し、@listへ格納
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
    list = List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ（セキリュティ対策/これより後に定義されたメソッドはアクションとして認識されない）
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
