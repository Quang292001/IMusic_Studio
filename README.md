# IMusic Studio

Website bán nhạc cụ — Spring Boot 2.6, Thymeleaf, Spring Security, JPA/MySQL, Cloudinary.

## Chạy local

```bash
docker run -d --name imusic-mysql -e MYSQL_ROOT_PASSWORD=sapassword -e MYSQL_DATABASE=imusic_studio -p 3317:3306 mysql:8.0
DB_URL="jdbc:mysql://127.0.0.1:3317/imusic_studio?allowPublicKeyRetrieval=true&useSSL=false" ./mvnw spring-boot:run
```

Mở http://localhost:8080

## Biến môi trường

| Biến | Ý nghĩa |
|---|---|
| `DB_URL`, `DB_USERNAME`, `DB_PASSWORD` | Kết nối MySQL |
| `MAIL_USERNAME`, `MAIL_PASSWORD` | Gmail SMTP (app password) |
| `CLOUDINARY_CLOUD_NAME`, `CLOUDINARY_API_KEY`, `CLOUDINARY_API_SECRET` | Upload ảnh sản phẩm |
| `PORT` | Cổng HTTP (Render tự đặt) |

## Deploy

Có `Dockerfile` sẵn — deploy lên Render (Web Service, runtime Docker) với MySQL trên TiDB Cloud Starter (miễn phí, tương thích MySQL).
