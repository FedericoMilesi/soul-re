# Soul Reaverse

An in-progress decompilation of the Jul 14, 1999 prototype of Legacy of Kain: Soul Reaver on the Playstation 1.

## Building (Linux)

### Install build dependencies
The build process has the following package requirements:
- git
- build-essential
- binutils-mips-linux-gnu
- python3
- bchunk
- 7z

Under a Debian based distribution, you can install these with the following commands:
```
sudo apt update
sudo apt install git build-essential binutils-mips-linux-gnu python3 bchunk p7zip-full p7zip-rar
```

### Clone the repository
Clone `https://github.com/FedericoMilesi/soul-re` in whatever directory you wish. Make sure to clone recursively!
```
git clone --recursive https://github.com/FedericoMilesi/soul-re.git
cd soul-re
```

### Install Python3 requirements
Run `pip3 install -r requirements.txt`
