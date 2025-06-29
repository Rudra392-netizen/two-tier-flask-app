## 🚀 My Custom Contributions

This repository was originally forked from [shubhamlondhe/two-tier-flask-app](https://github.com/shubhamlondhe/two-tier-flask-app), but I’ve made significant improvements and used it as a learning platform to explore Docker and container networking.

### 🔧 What I Added / Did:
- 🐳 **Wrote a complete Dockerfile** to containerize the Flask application.
- 🌐 **Created a custom Docker network** named `tws-net` to securely connect the Flask app with the MySQL container.
- 🧠 Understood and applied concepts like:
  - Docker bridge networks
  - Container communication
  - Port mappings and environment variables
  - 
- 📦 Successfully tested the setup by running both containers on the same network and accessing the application via browser.

---

## 🐳 How to Run This with Docker Networking

### 1. Clone the Repository

git clone https://github.com/Rudra392-netizen/two-tier-flask-app.git

cd two-tier-flask-app

 ## 2. Create a Docker Network
 
docker network create tws-net

## 3. Run MySQL Container
   
docker run -d \

  --name mysql-db \
  
  --network tws-net \
  
  -e MYSQL_ROOT_PASSWORD=root \
  
  -e MYSQL_DATABASE=students \
  
  mysql:5.7

## 4. Build the Flask App Docker Image 

docker build -t flask-app .

## 5. Run the Flask App Container

docker run -d \

  --name flask-app \
  
  --network tws-net \
  
  -p 5000:5000 \
  
  flask-app

##  6. Access the App

Open browser and visit:

👉 http://localhost:5000

🙏 Credits
This project was originally forked from shubhamlondhe/two-tier-flask-app.
I used it to practice Docker concepts and enhance my understanding of real-world deployments.


---

## ✅ Bonus Tip

You can also **pin a GitHub issue** or add a `LEARNING.md` file with:

```markdown
# What I Learned

- Dockerfile creation from scratch

- How to build and run containers

- Docker bridge networks

- MySQL container environment variables

- Connecting containers via custom network
