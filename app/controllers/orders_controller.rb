class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_top, only: [:index]

  def index
    @order_addresse = OrderAddresse.new 
  end

  def create
    @order_addresse = OrderAddresse.new(order_params)
    if @order_addresse.valid?
      pay_item
      @order_addresse.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefectre_id, :city, :house_number, :building_name, :phone_number, :prefectre_id, :price, :token).merge(item_id: params[:item_id], user_id: current_user.id,)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    if @item.order != nil || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

