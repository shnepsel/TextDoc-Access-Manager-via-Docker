# TextDoc Access Manager

TextDoc Access Manager is a simple C++ client-server application that I developed to allow users to manage access to text documents. The application supports user registration, login, and management of user credentials, all handled over a network using the Asio library.

## Features

- **Client-Server Architecture**: Separate client and server applications communicate to manage user data and authentication.
- **Cross-Platform Support**: Compatible with Linux, Windows and macOS.
- **Multithreaded Server**: Handles multiple client connections concurrently.

## Requirements for installation using Docker

- **Docker**

## Installation using Docker

### 1. Install Dependencies

#### Clone the Repository

```bash
git clone https://github.com/raufkhalilov/TextDoc-Access-Manager.git
cd TextDoc-Access-Manager
```

#### Pull image

```bash
docker pull scelle/textdoc-access-manager
```

### 2. Run the Application

#### Run the Server

```bash
docker run scelle/textdoc-access-manager
```

#### Run the Client

```bash
./client
```

## Requirements for manual installation

- **C++17** or higher
- **CMake 3.10** or higher
- **Asio library**

## Manual installation (for Linux)

### 1. Install Dependencies

I recommend using [vcpkg](https://github.com/microsoft/vcpkg) to install the Asio library.

#### Install vcpkg

```bash
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
sudo apt-get install curl zip unzip tar -y
./bootstrap-vcpkg.sh
```

#### Install Asio via vcpkg

```bash
sudo apt-get install g++ -y
./vcpkg install asio
sudo apt-get install libasio-dev libboost-all-dev -y
```

### 2. Clone the Repository

```bash
git clone https://github.com/raufkhalilov/TextDoc-Access-Manager.git
cd TextDoc-Access-Manager
```

### 3. Build the Project

1. **Configure the Project with CMake**

   Create a build directory and configure the project with CMake, pointing to the vcpkg toolchain file:

   ```bash
   mkdir build && cd build
   sudo apt install cmake -y
   cmake .. 
   make
   ```

### 4. Run the Application

#### Start the Server

```bash
./server
```

#### Run the Client

```bash
./client
```

## Usage

### Client Commands

- **Register**: Create a new user account.
- **Login**: Log in with an existing username and password.
- **Display Contents**: View the contents of your document stored on the server.
- **Change Username**: Update your username.
- **Change Password**: Update your password.

### Server Details

- The server listens on port `8080` and manages incoming client connections in separate threads.
- Ensure the `data` directory exists on the server, as it is used to store user files.

## Project Structure

- **client.cpp**: Contains the client-side logic and user interface.
- **server.cpp**: Contains the server-side logic for handling client requests.
- **CMakeLists.txt**: Build configuration file for CMake.
- **README.md**: Documentation for the project.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue or submit a pull request.
