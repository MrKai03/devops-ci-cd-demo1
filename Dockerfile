# Sử dụng Python 3.9 slim làm base image
FROM python:3.9-slim
# Tạo thư mục làm việc trong container
WORKDIR /app
# Copy file requirements.txt vào container
COPY requirements.txt requirements.txt
# Cài các thư viện trong requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# Copy toàn bộ mã nguồn vào container
COPY . .
# Mở cổng 5000 (Flask mặc định chạy port này)
EXPOSE 5000
# Lệnh chạy app khi container khởi động
CMD ["python", "app.py"]
