# Recon-Pocket

## Run It

```bash
sudo su
cd recon-pocket
export target="target.com" && docker compose up --build
```

## On Board

### Tools

```text
amass
subfinder
assetfinder
altdns
sublist3r
dnsrecon
```

## Coming Soon

### Tools

```text
dirsearch
httpx
httprob
waybackurls
gau
git-hound
gitdorks.sh (build-in tool)
naabu
gf
gf-templetes
nuclei
nuclei-templets
s3scanner
subjack
webpwn3r
scan.sh
```

## Ref

### Github

- https://github.com/OWASP/Amass
- https://github.com/eslam3kl/3klCon
- https://github.com/projectdiscovery/subfinder
- https://github.com/tomnomnom/assetfinder
- https://github.com/infosec-au/altdns
- https://github.com/aboul3la/Sublist3r
- https://github.com/crtsh

### Dockerhub

- https://hub.docker.com/r/caffix/amass
- https://hub.docker.com/r/projectdiscovery/subfinder

### Docker 

#### Install

- ubuntu
  - https://docs.docker.com/engine/install/ubuntu/
- debian
  - https://docs.docker.com/engine/install/debian/

#### Multi-Stage Build

- docker docs
  - https://docs.docker.com/develop/develop-images/multistage-build/
- python
  - https://blog.wu-boy.com/2021/07/building-minimal-docker-containers-for-python-applications/
- golang
  - https://amikai.github.io/2021/03/01/docker-multi-stage-build/