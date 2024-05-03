![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/LandonLi/docker-naiveproxy/ci.yaml?branch=master)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/1andonli/naiveproxy/master)
![Docker Pulls](https://img.shields.io/docker/pulls/1andonli/naiveproxy)

# docker-naiveproxy
 
## Usage

```bash
# Clone
git clone https://github.com/LandonLi/docker-naiveproxy.git
cd docker-naiveproxy

# Modify the configuration
cp config.json.example config.json

# Run and check
docker-compose up -d
curl -x socks5h://localhost:10081 ipinfo.io
```
