class ProductController < ApplicationController
	before_action :authenticate_user!

	def new
		@product = Product.new
		@categories = Category.all
	end

	def create
		#mặc định user_id bằng chính id của user nên không thêm theo cách bt
		@product =current_user.products.create(product_params)
		if @product.save
			redirect_to "/pro/index"
		else
			render :action => "/pro/new"
		end		
	end

	def product_params
		params.require(:product).permit(:name, :price, :image, :category_id, :quantity, :user_id)
	end

	def index
		@sort = params[:sort]
		if @sort == "ASC" or @sort = "DESC"
			@products = Product.order(price: @sort)
		else
			@products = Product.all
		end
	end

	def edit
		@product = Product.find(params[:id])
		@categories = Category.all
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		if @product.save
			redirect_to "/pro/index"
		else
			render :action => "/pro/edit/:id"
		end
	end

	def delete
		@product = Product.find(params[:id]).delete
		redirect_to "/pro/index"
	end
end
