# bookstore

## Mô tả : 
- Trang web bán sách dạy lập trình cho lập trình viên.

## Chức năng chính : 

#### Người dùng : 
- Đăng kí tài khoản, đăng nhập, đăng xuất.
- Tạo, thêm, sửa, xóa sản phẩm trong giỏ hàng.
- Đặt mua hàng, xem tình trạng đơn hàng, lịch sử giao dịch.

### Người quản lí (Admin)
- Có trang quản lí CMS riêng.
- Quản lí sản phẩm : Thêm, sửa, xóa thông tin sản phẩm.
- Quản lí người dùng : Xem, thêm, sửa, xóa tài khoản người dùng, xem lịch sử giao dịch người dùng.
- Quản lí đơn hàng : Xem, xác nhận đơn hàng, xác nhận thời gian giao hàng.
- Quản lí tài khoản admin : Thay đổi thông tin tài khoản admin.

## Công nghệ sử dụng : 
- Backend : Spring MVC, Hibernate, Microsoft SQL Server 2008.
- Frontend : HTML, CSS Javascript, Bootstrap.
- Tool : [Intellij IDEA](https://www.jetbrains.com/idea/), [VS Code](https://code.visualstudio.com/).

## Thông tin phiên bản : 
- Java 8
- Tomcat 8.0.53
- Miscrosoft SQL Server 2008 
- Spring MVC : 5.2.5
- Hibernate : 5.4.10
- Chi tiết phiên bản các gói jar khác có trong file pom.xml

## Cách thức cài đặt project : 
- Import project vào IDE.
- Cài đặt server chạy project : Nên sử dụng Tomcat cùng phiên bản hoặc cao hơn.
- Bên phía database, cài đặt tài khoản "sa" với mật khẩu "123456".
- Khởi chạy ứng dụng.
- Đường link đến trang CMS quản lí của admin : "projectname/administrator"
- Tài khoản admin mặc định : "binhdv"
- Mật khẩu admin mặc định : "123456"

## Một số hình ảnh website :
- Giao diện trang chủ : 
<img src="images/index.png" width="80%" />

- Sản phẩm : 
<img src="images/product.png" width="80%" />

- Giỏ hàng : 
<img src="images/cart.png" width="80%" />

- Tình trạng đơn hàng : 
<img src="images/order.png" width="80%" />

- Trang CMS admin : 
<img src="images/a-productmanager.png" width="80%" />


