class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する。
    @list = List.new
  end
end
