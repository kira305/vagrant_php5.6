Từ bản XAMPP 5.5.30 and 5.6.14, XAMPP đã không còn sử dụng MySQL, thay vào đó là MariaDB.  
[MariaDB không tương thích 100% với MySQL](https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/) và có thể thay thế bằng MySQL. Vậy, làm thế nào để thay thế MariaDB về Mysql ?

## Sao lưu CSDL

* Sao lưu toàn bộ Database
* Stop MariaDB service
* Đổi tên thư mục: `c:\xampp\mysql` thành `c:\xampp\mariadb`

## Cài đặt

* Tạo một thư mục rỗng: `c:\xampp\mysql`
* Tải MySQL về: https://dev.mysql.com/downloads/mysql/
* Chọn hệ điều hành, phiên bản phù hợp với máy bạn. 
* Giải nén tệp tin vừa tải về và copy vào `c:\xampp\mysql`
* Tạo một thư mục rỗng `c:\xampp\mysql\data`
* Tạo file `c:\xampp\mysql\bin\my.ini` và copy nội dung sau vào file:

```ini
[mysqld]
# set basedir to your installation path
basedir=c:/xampp/mysql
# set datadir to the location of your data directory
datadir=c:/xampp/mysql/data
```

### Khởi tạo dữ liệu

Khởi tạo MySQL bằng cách tạo đường dẫn data và các table hệ thống MySQL.

Mở CMD và nhập:

```cmd
cd c:\xampp\mysql\bin
mysqld --initialize
mysqld --initialize-insecure
```

Server sẽ tạo `'root'@'localhost'` cùng với mật khẩu ngẫu nhiên.

Vào thư mục `c:\xampp\mysql\data` tìm file `[computer name].err`. Trong file này có chứa mật khẩu vừa khởi tạo. `[computer name]` là tên máy tính của bạn.

Mở bằng Notepad++: `c:\xampp\data\[computer name].err` tìm dòng:

`[Note] A temporary password is generated for root@localhost: **************`

`**************` là mật khẩu vừa tạo.

Copy mật khẩu.

### Khởi động server

Bạn có thể dùng `XAMPP Control Panel` (MySQL > Start) để khởi động server.

### Kết nối server

Mở `cmd` lên và nhập:

```cmd
cd c:\xampp\mysql\bin
mysql -u root -p
```

Nhập mật khẩu vừa copy vào màn hình cmd.

Bây giờ đổi mật khẩu thành '' (rỗng).

```cmd
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY '';
```

Exit the mysql command:

```cmd
mysql> exit
```

## Khôi phục CSDL

Khôi phục CSDL từ file đã sao lưu.

### Nâng cấp từ một phiên bản cũ hơn.

Sửa các table bị lỗi.

```cmd
mysqlcheck.exe -u root -p --auto-repair --all-databases
```

Cập nhật cấu trúc lên bản mới nhất.

```cmd
mysql_upgrade.exe -u root -p
```

### Thay đổi my.ini

Bạn có thể tăng kích thước `innodb buffer pool size` để đạt hiệu suất cao hơn.  
`sql-mode` chỉ phù hợp với các bản MySQL < 5.7.

```ini
[mysqld]
# set basedir to your installation path
basedir=c:/xampp/mysql
# set datadir to the location of your data directory
datadir=c:/xampp/mysql/data

# Default: 134217728 (128 MB)
# New: 1024 MB
#innodb_buffer_pool_size = 1024M

# Mặc định cho các bản  < 5.7
sql-mode = "NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITU
```

### Nếu có lỗi khi migration thì thực hiện : 

```cmd
CREATE USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
```
