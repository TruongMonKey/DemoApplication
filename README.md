# 💻 Mac Shop - Spring Boot Demo Application

## 📝 Giới thiệu

Laptop Shop là một ứng dụng web mô phỏng hệ thống bán hàng Macbook trực tuyến, xây dựng trên nền tảng **Spring Boot** với kiến trúc phân tầng rõ ràng (MVC). Ứng dụng hỗ trợ hai vai trò: **Admin** (quản trị viên) và **Client** (người dùng cuối), cung cấp đầy đủ các chức năng quản lý sản phẩm, đơn hàng, người dùng, giỏ hàng, xác thực và phân quyền.

---

## 🚀 Tính năng nổi bật

### Đối với người dùng (Client)
- Đăng ký, đăng nhập, đăng xuất, đổi mật khẩu
- Xem danh sách sản phẩm, chi tiết sản phẩm
- Tìm kiếm, lọc sản phẩm
- Thêm sản phẩm vào giỏ hàng, cập nhật/xóa sản phẩm trong giỏ
- Đặt hàng, xem lịch sử đơn hàng, chi tiết đơn hàng
- Quản lý thông tin cá nhân

### Đối với quản trị viên (Admin)
- Đăng nhập quản trị
- Quản lý sản phẩm: thêm, sửa, xóa, tìm kiếm, phân loại
- Quản lý đơn hàng: xem, xác nhận, cập nhật trạng thái, xóa đơn hàng
- Quản lý người dùng: xem danh sách, phân quyền, khóa/mở tài khoản
- Dashboard thống kê tổng quan (số lượng sản phẩm, đơn hàng, doanh thu, người dùng...)

---

## 🏗️ Cấu trúc thư mục

```
src/
 └── main/
     ├── java/com/example/demo/
     │    ├── controller/
     │    │    ├── client/   # Controller cho người dùng cuối
     │    │    └── admin/    # Controller cho quản trị viên
     │    ├── service/
     │    │    ├── ProductService.java
     │    │    ├── OrderService.java
     │    │    ├── UserService.java
     │    │    ├── UploadService.java
     │    │    └── ...
     │    ├── repository/
     │    │    ├── ProductRepository.java
     │    │    ├── OrderRepository.java
     │    │    └── ...
     │    ├── domain/
     │    │    ├── Product.java
     │    │    ├── User.java
     │    │    ├── Order.java
     │    │    ├── Cart.java
     │    │    └── ...
     │    ├── config/
     │    │    ├── SecurityConfiguration.java
     │    │    ├── WebMvcConfig.java
     │    │    └── CustomSuccessHandler.java
     │    └── LaptopShopApplication.java
     ├── resources/
     │    └── application.properties
     └── webapp/WEB-INF/view/
          ├── client/   # Giao diện người dùng
          └── admin/    # Giao diện quản trị
```

---

## ⚙️ Công nghệ sử dụng

- **Java 17**
- **Spring Boot 3.x**
- **Spring Data JPA** (ORM)
- **Spring Security** (Xác thực, phân quyền)
- **MySQL** (Cơ sở dữ liệu)
- **JSP** (Giao diện, Tomcat Jasper)
- **Maven** (Quản lý phụ thuộc)
- **Jakarta Servlet/JSTL** (Hỗ trợ JSP)
- **Spring Session JDBC** (Quản lý session)

---

## 🔧 Hướng dẫn cài đặt & chạy ứng dụng

### 1. Chuẩn bị môi trường

- Cài đặt **Java 17** trở lên
- Cài đặt **MySQL** (hoặc MariaDB)
- Cài đặt **Maven** (hoặc sử dụng script `mvnw` đi kèm)

### 2. Tạo database

Tạo database tên `laptopshop` trong MySQL:

```sql
CREATE DATABASE laptopshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 3. Cấu hình kết nối database

Chỉnh sửa file `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD
```

### 4. Build & chạy ứng dụng

```bash
# Build project
./mvnw clean install

# Chạy ứng dụng
./mvnw spring-boot:run
```

Truy cập ứng dụng tại: [http://localhost:8080](http://localhost:8080)

---

## 👤 Tài khoản mẫu

> **Lưu ý:** Bạn nên tự tạo tài khoản hoặc seed dữ liệu mẫu cho lần đầu chạy.

- **Admin:**
  - Username: `admin`
  - Password: `admin`
- **User:**
  - Username: `user`
  - Password: `user`

---

## 🛠️ Mô tả các module chính

### 1. Controller

- `controller/client/`: Xử lý các request từ phía người dùng cuối (trang chủ, sản phẩm, giỏ hàng, đặt hàng, đăng nhập/đăng ký...)
  - `HomePageController.java`
  - `ItemController.java`
- `controller/admin/`: Xử lý các request quản trị (quản lý sản phẩm, đơn hàng, người dùng, dashboard...)
  - `ProductController.java`
  - `OrderController.java`
  - `UserController.java`
  - `DashboardController.java`

### 2. Service

- Xử lý logic nghiệp vụ cho từng chức năng:
  - `ProductService.java`: Quản lý sản phẩm
  - `OrderService.java`: Quản lý đơn hàng
  - `UserService.java`: Quản lý người dùng
  - `UploadService.java`: Xử lý upload file
  - `CustomUserDetailsService.java`: Tích hợp Spring Security

### 3. Repository

- Giao tiếp với database thông qua Spring Data JPA:
  - `ProductRepository.java`
  - `OrderRepository.java`
  - `UserRepository.java`
  - `CartRepository.java`
  - `RoleRepository.java`
  - ...

### 4. Domain (Entity)

- Định nghĩa các bảng dữ liệu:
  - `Product.java`: Sản phẩm
  - `User.java`: Người dùng
  - `Order.java`: Đơn hàng
  - `Cart.java`, `CartDetail.java`: Giỏ hàng
  - `OrderDetail.java`: Chi tiết đơn hàng
  - `Role.java`: Vai trò người dùng

### 5. Config

- Cấu hình bảo mật, session, MVC:
  - `SecurityConfiguration.java`: Cấu hình Spring Security, phân quyền, login/logout
  - `WebMvcConfig.java`: Cấu hình view resolver, static resource
  - `CustomSuccessHandler.java`: Xử lý chuyển hướng sau đăng nhập

### 6. View (JSP)

- Giao diện chia thành hai phần:
  - `client/`: Trang chủ, sản phẩm, giỏ hàng, đăng nhập/đăng ký, lịch sử đơn hàng...
  - `admin/`: Dashboard, quản lý sản phẩm, đơn hàng, người dùng...

---

## 📝 Hướng dẫn phát triển/mở rộng

- Thêm entity mới: Tạo class trong `domain/`, repository, service, controller và view tương ứng.
- Thay đổi giao diện: Sửa file JSP trong `webapp/WEB-INF/view/client` hoặc `admin`.
- Thay đổi cấu hình bảo mật: Sửa trong `config/SecurityConfiguration.java`.
- Thay đổi cấu hình database: Sửa trong `application.properties`.

---

## 📚 Tham khảo

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Spring Security Documentation](https://spring.io/projects/spring-security)
- [Spring Data JPA Documentation](https://spring.io/projects/spring-data-jpa)
- [Maven Documentation](https://maven.apache.org/guides/index.html)

---

> *README này được sinh tự động dựa trên mã nguồn và cấu trúc project. Bạn nên bổ sung thêm hình ảnh, hướng dẫn chi tiết, hoặc các lưu ý đặc biệt nếu cần thiết!* 