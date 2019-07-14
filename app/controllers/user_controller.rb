class UserController < ApplicationController
#nếu chưa đăng nhập nó sẽ tự động bỏ qua controller này, không truy cập vào các action của controller này.
  before_action :authenticate_user!

  def edit    
  end

  
  def update
    #current_user.update(password: '123456', password_confirmation: '123456')
    # Khi mà dùng .update thì ko cần dùng current_user.save nữa, mà redirect luôn
    # Nhưng vì mình cần kiểm tra .save để xem data user nhập vô có đúng hay không, chẳng hạn như password phải lớn hơn 6 ký tự, email phải là email đúng nên không nên dùng .update trực tiếp 
    
    # BÂY GIỜ VIỆC EM CẦN LÀM TIẾP LÀ
    # Nếu user nhập vô 2 password khác nhau, thì báo lỗi là password và password confirmation không giống nhau
    # E search google 
    current_user.assign_attributes(user_params)
    # hôm qua anh viết cho e đoạn mẫu a ri, a cũng nói em không cần quan tâm thêm j hết,
    # Cứ đúng a ri thì password sẽ được thay đổi và hấn tự mã hóa cho e
    # ANh viết a rứa nghĩa là password sẽ được đổi thành newpassword, newpasssword ở đây là 1 string
    # Em để nguyên đoạn nớ vô controller mà không sửa chi cả, thì ngoài view em có nhập
    # password mới là chi đi nữa thì password mới luôn luôn là newpasssword
    # Em hiểu đoạn ni chưa? dạ rồi. 
    # Cũng như việc anh viết sẵn cho 123456 thì em cứ để rứa là quá sai

    # Hôm qua anh cũng có bảo là nếu .update rồi thì ko cần save nữa, nó lưu ở đoạn update
    # luôn rồi
    # Cho nên không cần đoạn dưới ni, nhưng em có thể sửa .update thành .assign_attributes
    # Cái ni mới, giống như .new

    # Lệnh puts, khi em ko biết data em nhập vô có đúng không, hấn a răng, em dùng lệnh
    # puts

    # luôn luôn phải dùng, phải nhớ
    # Ví dụ em muốn biết user_params hấn trả về kết quả a răng
    puts "USER PARAMS"
    puts user_params
    # Em hiểu đoạn puts ni chưa? e hiểu rồi nạ 
    # Từ nay e bắt buộc phải luôn luôn dùng, a nhắc 1 lần duy nhất thôi
    #USER PARAMS
    #{"email"=>"tuan@gmail.com", "password"=>"1234567", "password_confirmation"=>"123                                                   4567"}


    # Khoan, anh chỉ thêm cái nữa. Chẳng hạn em muốn check xem current_user có được lưu dữ liệu
    # Mới hay không, em cũng dùng puts. Ví dụ
    # Trường hợp không được lưu, em có thể dùng curent_user.errors.full_messages để lấy thông tin lỗi
    # E dùng thông tin đó hiển thị ra cho user biết lỗi j

    # Em hiểu đoạn ni chưa? e hiểu rồi nạ
    # Nhớ nhìn kỹ hấn puts ra những chi
    respond_to do |format|
      if current_user.save
        puts "ĐÃ ĐƯỢC LƯU"
        format.html { redirect_to "/", notice: 'user was successfully created.' }
        format.json { render :edit, status: :created, location: current_user }
      else
        puts "KHÔNG ĐƯỢC LƯU"
        puts "LỖI LÀ"
        puts "LỖI LÀ #{current_user.errors.full_messages}"
        # LỖI LÀ ["Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)"]
        # Giờ em show 2 lỗi ni ra màn hình cho user biết nếu user nhập sai . A thoát đây
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  def user_params
    #  SyntaxError (D:/Desktop/tuanruby/app/controllers/user_controller.rb:48: syntax error, unexpected ')', expecting =>):
    # Em phải kiểm tra lỗi syntax trước khi chụp gửi cho anh

    # kiểu ni cũng là 1 vấn đề to, e copy bên product param sang mà mãi em mới làm đúng dc
    # 
    params.require(:user).permit(:email, :first_name, :last_name, :age, :password, :password_confirmation)
  end


end
