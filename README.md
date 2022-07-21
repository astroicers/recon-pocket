# Recon-Pocket

## Run It

```bash
cd recon-pocket
export target="target.com" && docker compose up --build
```

## On Board

```text
amass
subfinder
assetfinder
altdns
```

## Coming Soon

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

- python
  - https://blog.wu-boy.com/2021/07/building-minimal-docker-containers-for-python-applications/
- golang
  - https://amikai.github.io/2021/03/01/docker-multi-stage-build/