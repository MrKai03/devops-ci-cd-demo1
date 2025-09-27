**DevOps CI/CD Demo – Flask + Docker**



**Mục tiêu dự án**



Dự án này minh họa pipeline CI/CD cơ bản cho một ứng dụng Flask:



1. Test: Chạy unit test bằng pytest.
2. Docker build: Đóng gói app vào Docker image.
3. Push image: Đẩy Docker image lên Docker Hub.
4. Deploy: Triển khai trên Render/VPS/Heroku.



Ứng dụng đơn giản trả về "Hello DevOps CI/CD Demo!" khi truy cập.



**Công nghệ sử dụng**



* Python 3.9+
* Flask
* Docker
* GitHub Actions (CI/CD)
* Docker Hub (Registry)
* Render (Deployment)



**Cấu trúc dự án**

devops-ci-cd-demo/

├─ app.py                # Flask app

├─ requirements.txt      # Dependencies

├─ Dockerfile            # Docker build instructions

├─ .dockerignore

├─ tests/

│  └─ test\_app.py        # Unit test

└─ .github/workflows/ci-cd.yml



**Chạy local**

1. Tạo virtual environment:

python -m venv venv

source venv/bin/activate   # Windows: venv\\Scripts\\activate



**2.** Cài dependencies:

pip install -r requirements.txt



**3.** Chạy app:

python app.py



**4**. Mở trình duyệt: http://localhost:5000 → phải thấy "Hello DevOps CI/CD Demo!".



**5**.Chạy test:



pytest -q

\# Output: 1 passed



**Build Docker**

docker build -t <username>/ci-cd-demo:local .

docker run -p 5000:5000 <username>/ci-cd-demo:local



**CI/CD pipeline**



**GitHub Actions workflow:** .github/workflows/ci-cd.yml



**Steps:**

1. Checkout code
2. Setup Python \& install dependencies
3. Run tests (pytest)
4. Build Docker image
5. Push image lên Docker Hub (latest + commit SHA)



**Secrets cần thiết trên GitHub**

Name	                Value

DOCKER\_USERNAME	<Docker Hub username>

DOCKER\_PASSWORD	<Docker Hub Access Token>



**Triển khai trên Render**

* Link demo: https://devops-ci-cd-demo1.onrender.com
* Render tự build Docker image từ repo GitHub và chạy container.
* Container sẽ chạy trên port 10000 (hoặc port mà Render yêu cầu).

**Kiểm tra sau deploy**

* Truy cập link Render → phải thấy "Hello DevOps CI/CD Demo!".
* Kiểm tra logs Render nếu app không chạy.



**Lỗi thường gặp**

* Workflow fail lúc login Docker → Kiểm tra secrets DOCKER\_USERNAME và DOCKER\_PASSWORD.
* App không reachable → đảm bảo app.run(host="0.0.0.0") và port mapping đúng.
* Test fail → chạy pytest local để debug.



