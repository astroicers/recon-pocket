# Recon-Pocket

## Description

> Coming and Soon.

## Flow Chart

```mermaid
graph LR

  style A  stroke:red,stroke-width:4px
  style B1 stroke:red,stroke-width:4px
  style B2 stroke:red,stroke-width:4px
  style C1 stroke:red,stroke-width:4px
  style C2 stroke:red,stroke-width:4px
  style C3 stroke:red,stroke-width:4px
  style C4 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style D1 stroke:red,stroke-width:4px
  style D2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style D3 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E1 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E3 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E4 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E5 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F1 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  A(Domain) -->|whois| B1(Whois Info)
  A(Domain) -->|amass| B2(Subdomain)
  A(Domain) -->|subfinder| B2(Subdomain)
  A(Domain) -->|assetfinder| B2(Subdomain)
  A(Domain) -->|sublist3r| B2(Subdomain)
  B2(Subdomain) -->|altdns| B2(Subdomain)
  B2(Subdomain) -->|ping| C1(Live Subdomain) & C2(Dead Subdomain)
  C1(Live Subdomain) -->|git-hound| C3(Secret on Github)
  C1(Live Subdomain) -->|gau| C4(History on Internet)
  C1(Live Subdomain) -->|waybackurls| C4(History on Internet)
  C1(Live Subdomain) -->|dnsrecon| D1(Subdomain Info)
  C1(Live Subdomain) -->|dig| D1(Subdomain Info)
  C1(Live Subdomain) -->|nmap| D2(Service Info)
  C1(Live Subdomain) -->|google hacking| D3(Leak on Google)
  D2(Service Info) --> E1(HTTP)
  D2(Service Info) --> E2(HTTPS)
  D2(Service Info) --> E3(SMB)
  D2(Service Info) --> E4(SNMP)
  D2(Service Info) --> E5(RDP)
  E1("HTTP(S)") -->|dirsearch| F1(Subdirectory)
  E1("HTTP(S)") -->|nikto| F2(Vuln Info)
```

```mermaid
graph TD
  style Test1 stroke:red,stroke-width:4px
  style Test2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  Test1(Done)
  Test2(Building)
```

## Run It

> This project is still under construction.

> All commands are still being tested.

### Terminal First

```bash
sudo su
cd ~/recon-pocket
export target="target.com"

docker compose -f ./docker-compose.viewer.yml up
```

### Terminal Second

```bash
sudo su
cd ~/recon-pocket
export target="target.com"

docker compose -f ./docker-compose.whois.yml up

docker compose -f ./docker-compose.find_subdomain.yml up
chmod +x ./subdomain.sh && ./subdomain.sh
cp ./treasure/subdomain.txt ./altdns/

docker compose -f ./docker-compose.mutate.yml up
chmod +x ./subdomain_live.sh && ./subdomain_live.sh
cp ./treasure/subdomain_live.txt ./dnsrecon/
cp ./treasure/subdomain_live.txt ./dig/

docker compose -f ./docker-compose.dns_info.yml up
```

## On Board

### Tools Useds

- [X] amass
- [X] subfinder
- [X] assetfinder
- [X] altdns
- [X] sublist3r
- [X] dnsrecon
- [X] git-hound
- [X] gau
- [X] waybackurls
- [ ] wapiti
- [ ] arjun
- [ ] dirsearch
- [ ] httpx
- [ ] httprob
- [ ] naabu
- [ ] gf
- [ ] gf-templetes
- [ ] nuclei
- [ ] nuclei-templets
- [ ] s3scanner
- [ ] subjack
- [ ] webpwn3r
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
