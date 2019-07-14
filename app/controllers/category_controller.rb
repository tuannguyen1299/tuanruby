class CategoryController < ApplicationController
	before_action :authenticate_user!

	def index
		# Không vào được rails c nên a viết ví dụ ở đây
		# cách tạo 1 category và 1 product thuộc về category đó
		# Cứ mỗi lần truy cập localhost:3000/categories thì mấy lệnh ni sẽ được gọi
		#category = Category.create(name: "Tên category")
		# Cách 1:
		#category.products.create(name: "Xà phòng", price: 100000, quantity: 100) # Không cần khai báo category_id

		#Cách 2
		#Product.create(name: "Xà phòng", price: 100000, quantity: 100, category_id: category.id)
		@categories = Category.all
	end
	def new
		
		@category = Category.new
	end
	# def create
	# 	@category = category.new[category_params]
	# 	@category.name = params[:name]

	# 	@category.save

	# end

	# def category_params
    # 	params.require(:category).permit(:name)
   	# end
	def create
		@category = Category.new(category_params)
		puts "Category params là gì? #{category_params}"
		# e hiểu phần puts ni chưa?
		
		if @category.save # => trả về true, tức là lưu thành công thì redirect đến trang /categories
			redirect_to '/cat/index'
		else
			# không lưu thành công, chuyển đến trang new, a thoát đây
			render :action => '/cat/new'
		end
	end

	# em cứ theo cách ni, tìm hiểu dần sau
	# params.require(:category).permit(:name)
	# là từ 
	# <input type="text" class="form-control" name="category[name]" placeholder="Tên sản phẩm">
	# để ý cái name = category[name]
	# nếu name = product[price] thì params.require(:product).permit(:price)
	# product sẽ có nhiều field hơn => params.require(:product).permit(:name, :price) => cách nhau dấu ,
	# a out đây
	# à còn cái puts
	def category_params
		params.require(:category).permit(:name)
	end
	def edit
		@category = Category.find(params[:id])

	end
	def update
	    @category = Category.find(params[:id])
	   
	    if @category.update(category_params)
	      redirect_to '/cat/index'
	    else
	      render :action => '/cat/edit/:id'
	    end
  	end
  	def delete
  		@category = Category.find(params[:id])
  		@category.delete	
  		redirect_to '/cat/index'
  		
  	end


end
