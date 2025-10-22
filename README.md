Phân tích hành vi người dùng smartphone

1. SQL
Project này sử dụng SQL để phân tích bộ dữ liệu về hành vi người dùng điện thoại di động. Mục tiêu là khám phá các xu hướng sử dụng thiết bị, ứng dụng, pin và dữ liệu, cũng như phân khúc người dùng dựa trên các yếu tố nhân khẩu học (tuổi, giới tính) và hành vi sử dụng.

1.1 Bộ dữ liệu
Bộ dữ liệu user_behavior_dataset chứa thông tin chi tiết về hành vi của 700 người dùng, bao gồm:
- User_ID: Mã định danh người dùng
- Device_Model: Tên thiết bị di động
- Operating_System: Hệ điều hành (Android, iOS)
- App_Usage_Time_min_day: Thời gian sử dụng ứng dụng trung bình mỗi ngày (phút)
- Screen_On_Time_hours_day: Thời gian bật màn hình trung bình mỗi ngày (giờ)
- Battery_Drain_mAh_day: Lượng pin tiêu thụ trung bình mỗi ngày
- Number_of_Apps_Installed: Số lượng ứng dụng được cài đặt
- Data_Usage_MB_day: Lượng dữ liệu sử dụng trung bình mỗi ngày
- Age: Tuổi người dùng
- Gender: Giới tính
- User_Behavior_Class: Phân loại nhóm hành vi người dùng

1.2 Phân tích chính
Project tập trung vào các khía cạnh sau:
- Tổng quan dữ liệu: Khám phá cấu trúc và nội dung của bộ dữ liệu, bao gồm số lượng người dùng, thiết bị, hệ điều hành và giới tính.
- Phân tích mức độ sử dụng: Đánh giá mối tương quan giữa thời gian sử dụng ứng dụng, lượng pin tiêu thụ và lượng dữ liệu sử dụng. So sánh các chỉ số này giữa các nhóm hành vi người dùng khác nhau.
- Phân tích nhân khẩu học: Nghiên cứu ảnh hưởng của giới tính và độ tuổi đến hành vi sử dụng thiết bị và ứng dụng.
- Phân khúc người dùng: Chia người dùng thành các nhóm dựa trên mức độ sử dụng ứng dụng (Heavy User, Moderate User, Light User) và phân tích đặc điểm của từng nhóm.
- So sánh theo hệ điều hành: So sánh hành vi sử dụng giữa người dùng Android và iOS.
- Tổng kết hành vi theo lớp: Tổng hợp các chỉ số hành vi trung bình cho từng lớp hành vi người dùng đã được phân loại sẵn trong bộ dữ liệu.

1.3 Kết quả nổi bật
Phân tích cho thấy nhóm người dùng dưới 25 tuổi có xu hướng sử dụng ứng dụng, tiêu thụ dữ liệu và pin nhiều nhất.
Người dùng iOS có mức sử dụng trung bình cao hơn so với người dùng Android trên một số chỉ số.
Nhóm hành vi số 5 được xác định là nhóm sử dụng ứng dụng nhiều nhất.

1.4 Công nghệ sử dụng
SQL 

1.5 Cách sử dụng
Để chạy lại phân tích này, bạn cần:
- Tải bộ dữ liệu user_behavior_dataset.
- Mở notebook trong Azure data studio hoặc tải file .sql về.
- Kết nối với môi trường chạy.
- Thực thi các câu lệnh SQL trong notebook hoặc file .sql.
