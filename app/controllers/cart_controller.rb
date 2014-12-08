 class CartController < ApplicationController
    def show
       begin
        @cart = Cart.find(params[:id])
        rescue ActiveRecord::RecordNotFound
             logger.error "Attempt to access invalid cart #{params[:id]}"
           redirect_to store_url, notice: 'Invalid cart'
            else
                respond_to do |format|
                  format.html # show.html.erb
                  format.json { render json: @cart }
                end
                 end
    end
    def add
      id = params[:id]
      cart = session[:cart] ||= {}
      cart[id] = (cart[id] || 0) + 1
      redirect_to :action => :index
    end
    def index
      @cart = session[:cart] || {}
    end
    def change
      cart = session[:cart]
      id = params[:id];
      quantity = params[:quantity].to_i
      if cart and cart[id]
        unless quantity <= 0
          cart[id] = quantity
        else
          cart.delete id
        end
      end
      redirect_to :action => :index
    end
    def checkout
      flash[:notice] = "CHECKOUT IS NOT IMPLEMENTED YET!!!"
      redirect_to :action => :index
    end
    def remove
      id = params[:id]
      cart = session[:cart]
      cart.delete id
      redirect_to :action => :index
    end
    def clearCart
      session[:cart] = nil
      redirect_to :action => :index
    end
    def destroy
       @cart = current_cart
      @cart.destroy
      session[:cart_id] = nil
     respond_to do |format|
         format.html { redirect_to store_url,
         notice: 'Your cart is currently empty' }
        format.json { head :no_content }
      end
    end
  end

