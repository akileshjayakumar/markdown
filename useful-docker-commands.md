# Docker and Git Commands

## Docker Commands

### General Docker Maintenance

- **Remove all Docker containers:**
  ```bash
  docker rm -f $(docker ps -a -q)
  ```
  _This command forcefully removes all Docker containers, whether they are stopped or running. Useful for cleaning up your environment._

- **Remove all Docker images:**
  ```bash
  docker rmi $(docker images -a -q)
  ```
  _This command removes all Docker images from your system. It's a good way to free up disk space after containers have been removed._

### Managing Docker Services

- **Remove unknown AppArmor profiles:**
  ```bash
  sudo aa-remove-unknown
  ```
  _AppArmor profiles can sometimes cause conflicts with Docker containers. This command removes any unknown profiles to prevent issues._

- **Restart Docker service:**
  ```bash
  sudo systemctl restart docker.service
  sudo systemctl restart docker
  ```
  _Use these commands to restart the Docker service. Restarting Docker can resolve issues with container startup or performance._

### Working Inside a Docker Container

- **Access a running container:**
  ```bash
  docker exec -it ragas-container sh
  ```
  _This command opens an interactive shell inside the `ragas-container` Docker container, allowing you to execute commands directly within the container._

### Running Qdrant on Localhost

- **Start Qdrant service:**
  ```bash
  docker run -d --name qdrant -p 6333:6333 qdrant/qdrant
  curl http://localhost:6333
  ```
  _This command starts the Qdrant service in a Docker container and maps it to port 6333 on your localhost. The `curl` command checks if the service is running._

### Building and Running RAGAS

- **Build the RAGAS Docker image:**
  ```bash
  docker build -t ragas -f ragas/Dockerfile .
  ```
  _This command builds a Docker image for RAGAS using the Dockerfile located in the `ragas` directory._

- **Run the RAGAS Docker container:**
  ```bash
  docker run -it --name ragas ragas
  ```
  _This command runs the RAGAS Docker container in interactive mode._

- **Remove the RAGAS container:**
  ```bash
  docker rm -f ragas 2>/dev/null || true
  ```
  _This command forcefully removes the RAGAS Docker container if it exists, ignoring errors if the container is not found._

### Complete Setup Script

- **Run the full setup script:**
  ```bash
  mkdir -p ragas/eval_dataset ragas/ragas_result ragas/source_data && \
  docker rm -f qdrant && \
  (docker network ls | grep -wq ragas-network || docker network create ragas-network) && \
  docker build -t ragas-pipeline -f ragas/Dockerfile . && \
  docker rm -f ragas-container 2>/dev/null || true && \
  docker run -d --name qdrant --network ragas-network -p 6333:6333 qdrant/qdrant && \
  docker run -it --name ragas-container --network ragas-network \
    -v $(pwd)/ragas/eval_dataset:/app/ragas/eval_dataset \
    -v $(pwd)/ragas/ragas_result:/app/ragas/ragas_result \
    -v $(pwd)/ragas/source_data:/app/ragas/source_data \
    ragas-pipeline
  ```
  _This script automates the setup process for RAGAS. It creates necessary directories, builds the Docker image, and runs the containers, all within a custom Docker network._

## Git Commands

### Managing Git Remotes

- **Set a new remote URL:**
  ```bash
  git remote set-url origin https://your-username:your-token@huggingface.co/your-repo
  ```
  _This command updates the remote URL of your Git repository. Useful when you need to push or pull from a different repository or using a new token for authentication._

- **Pull the latest changes from the remote repository:**
  ```bash
  git pull origin
  ```
  _This command fetches and integrates the latest changes from the remote repository into your local branch._

## Updating Visual Studio Code

### Install or Update VSCode

- **Install and update Visual Studio Code:**
  ```bash
  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code
  ```
  _These commands install and update Visual Studio Code on a system running Debian-based Linux distributions._

---
