## 🚀 My Custom Contributions
This repository was originally forked from shubhamlondhe/two-tier-flask-app, but I’ve made significant improvements and used it as a learning platform to explore Docker and container networking.

## 🔧 What I Added / Did:
🐳 Wrote a complete Dockerfile to containerize the Flask application.

🌐 Created a custom Docker network named tws-net to securely connect the Flask app with the MySQL container.

📝 Wrote a docker-compose.yaml file from scratch to orchestrate both containers easily.

🧠 Understood and applied concepts like:

Docker bridge networks

Container communication

Port mappings and environment variables

📦 Successfully tested the setup by running both containers on the same network and accessing the application via browser.

🐳 How to Run This with Docker Networking
## 1. Clone the Repository
   
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

Open your browser and go to:

## 👉 http://localhost:5000

## ❗ Common Problems Faced While Writing or Running docker-compose.yaml

Even though Docker Compose simplifies managing multi-container apps, you can still run into some issues. Here are a few common ones I faced while building and running this project:

## 🧱 1. Indentation Errors in YAML

YAML is very sensitive to spaces. Even a single space out of place can break the whole file.

## 🧠 Tip: Make sure to use only spaces, never tabs. Use an editor like VS Code with the Red Hat YAML extension for live error checking.

## 🕵️‍♂️ 2. Wrong Placement of Volumes or Networks

Sometimes, we mistakenly write volumes: or networks: inside the services block instead of at the bottom. This causes confusing errors.

## 🧠 Tip: Keep volumes: and networks: at the same level as services: (not nested inside it).

## 🛑 3. Port Already in Use

When you try to expose 5000:5000 or 3306:3306, Docker might throw an error like:

Bind for 0.0.0.0:5000 failed: port is already allocated.

## 🧠 Tip: Make sure no other container or app is already using that port. You can stop all running containers using:


docker ps

docker stop <container-id>

## 🔗 4. Containers Can’t Talk to Each Other

Sometimes, the Flask app can’t connect to MySQL even though both containers are running.

## 🧠 Tip: Ensure both containers are on the same Docker network, and that you're using the container name (e.g., mysql) as the hostname in environment variables.

## 🐳 5. Forgetting to Rebuild After Changes

If you make changes to your Dockerfile or code but don’t rebuild the image, the old version will keep running.

## 🧠 Tip: Always use --build with docker-compose up after making changes:


docker-compose up --build

## ⚠️ 6. Missing Environment Variables

If you forget to define something like MYSQL_PASSWORD, the MySQL container might start but not work correctly.

## 🧠 Tip: Double-check your environment: section, and make sure all required variables are present.

## ✅ Conclusion

I faced most of these issues when I first started, and solving them helped me understand Docker Compose more deeply. With time, writing and debugging these files becomes second nature!

## 📦 How to Run Using Docker Compose

If you prefer using Docker Compose, follow these steps:

## 1. Clone the Repository

git clone https://github.com/Rudra392-netizen/two-tier-flask-app.git

cd two-tier-flask-app

## 2. Make Sure docker-compose.yaml Exists

Ensure that the docker-compose.yaml file is present in the root of the project. You can open it in VS Code to verify.

## 3. Run the Full Stack with Compose
   
docker-compose up --build

## Or if you're using Docker v2:


docker compose up --build

## 🛠 This will:

## Build the Flask app image

## Start both the MySQL and Flask app containers

## Automatically connect them on a shared network

## 4. Access the App

Visit: 👉 http://localhost:5000

✅ Bonus Tip

## Stop the containers when you're done:

docker-compose down

## Or remove volumes as well:

docker-compose down -v

# What I Learned

- Dockerfile creation from scratch
- 
- How to build and run containers
- 
- Docker bridge networks
- 
- MySQL container environment variables
- 
- Connecting containers via custom network
- 
- Writing a full docker-compose.yaml file for multi-container setup

## 🧑‍💻 GitHub Info

Username: Rudra392-netizen

Repository URL: https://github.com/Rudra392-netizen/two-tier-flask-app


