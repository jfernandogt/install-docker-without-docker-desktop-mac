# Docker Setup Without Docker Desktop on macOS

This repository contains a script to automate the setup of Docker on macOS without requiring Docker Desktop. This solution is ideal for developers looking to manage containers efficiently while avoiding Docker Desktop licensing costs.

## Features

-  **Automated Installation**: Installs Docker, docker-credential-helper, docker-compose, and docker-buildx using Homebrew.
-  **Configuration**: Configures Docker to use the macOS keychain for credential management and sets up Docker CLI plugins.
-  **Colima Integration**: Installs Colima to provide a lightweight container runtime environment.

## Prerequisites

-  **Homebrew**: Ensure Homebrew is installed on your macOS system. You can install it from [Homebrew's official website](https://brew.sh/).

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/jfernandogt/install-docker-without-docker-desktop-mac.git
   cd install-docker-without-docker-desktop-mac
   ```

2. Make the Script Executable:
   ```bash
   chmod +x setup_docker.sh
   ```

3. Run the Script:
   ```bash
   ./setup_docker.sh
   ```

4. Verify Installation:
  After running the script, verify that Docker and its components are correctly installed by checking the version:
   ```bash
   docker --version
   docker compose version
   ```
