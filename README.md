# Recon-Pocket

## Flow Chart

```mermaid
  
graph LR
  A(Domain) -->|whois| B1(Whois Info)
  A(Domain) -->|amass| B2(Subdomain)
  A(Domain) -->|subfinder| B2(Subdomain)
  A(Domain) -->|assetfinder| B2(Subdomain)
  A(Domain) -->|sublist3r| B2(Subdomain)
  B2(Subdomain) -->|altdns| B2(Subdomain)
  B2(Subdomain) -->|ping| C1(Live Subdomain) & C2(Dead Subdomain)
  C1(Live Subdomain) -->|dnsrecon| D1(Subdomain Info)
  C1(Live Subdomain) -->|dig| D1(Subdomain Info)
```

## Run It

> This project is still under construction.

> All commands are still being tested.

```bash
sudo su
cd ~/recon-pocket
export target="target.com"
docker compose -f ./docker-compose.viewer.yml up
docker compose -f ./docker-compose.find_subdomain.yml up
docker compose -f ./docker-compose.mutate.yml up
docker compose -f ./docker-compose.dns_info.yml up
```

## On Board

### Tools

- [X] amass
- [X] subfinder
- [X] assetfinder
- [X] altdns
- [X] sublist3r
- [X] dnsrecon
- [ ] dirsearch
- [ ] httpx
- [ ] httprob
- [ ] waybackurls
- [ ] gau
- [ ] git-hound
- [ ] gitdorks.sh
- [ ] naabu
- [ ] gf
- [ ] gf-templetes
- [ ] nuclei
- [ ] nuclei-templets
- [ ] s3scanner
- [ ] subjack
- [ ] webpwn3r
- [ ] scan.sh
- [ ] enum4linux
- [ ] feroxbuster
- [ ] gobuster
- [ ] impacket-scripts
- [ ] nbtscan
- [ ] nikto
- [ ] nmap
- [ ] onesixtyone
- [ ] oscanner
- [ ] redis-tools
- [ ] smbclient
- [ ] smbmap
- [ ] snmpwalk
- [ ] sslscan
- [ ] svwar
- [ ] tnscmd10g
- [ ] whatweb
- [ ] wkhtmltopdf

## Ref

### Github

- https://github.com/OWASP/Amass
- https://github.com/eslam3kl/3klCon
- https://github.com/projectdiscovery/subfinder
- https://github.com/tomnomnom/assetfinder
- https://github.com/infosec-au/altdns
- https://github.com/aboul3la/Sublist3r
- https://github.com/crtsh
- https://github.com/darkoperator/dnsrecon
- https://github.com/Tib3rius/AutoRecon

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