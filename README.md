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
  style C4 stroke:red,stroke-width:4px
  style D1 stroke:red,stroke-width:4px
  style D2 stroke:red,stroke-width:4px
  style D3 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E1 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style E3 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F1 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F3 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F4 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F5 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  style F6 stroke:red,stroke-width:4px,stroke-dasharray: 5 5 
  A(Domain) -->|"whois✅"|B1(Whois Info)
  A(Domain) -->|"amass✅"|B2(Subdomain)
  A(Domain) -->|"subfinder✅"|B2(Subdomain)
  A(Domain) -->|"assetfinder✅"|B2(Subdomain)
  A(Domain) -->|"sublist3r✅"|B2(Subdomain)
  A(Domain) -->|"crt.sh✅"|B2(Subdomain)
  B2(Subdomain) -->|"altdns✅"|B2(Subdomain)
  B2(Subdomain) -->|"ping✅"|C1(Live Subdomain) & C2(Dead Subdomain)
  C1(Live Subdomain) -->|"git-hound✅"|C3(Secret on Github)
  C1(Live Subdomain) -->|"gau✅"|C4(History on Internet)
  C1(Live Subdomain) -->|"waybackurls✅"|C4(History on Internet)
  C1(Live Subdomain) -->|"dnsrecon✅"|D1(Subdomain Info)
  C1(Live Subdomain) -->|"dig✅"|D1(Subdomain Info)
  C1(Live Subdomain) -->|"nmap✅"|D2(Service Info)
  C1(Live Subdomain) -->|"google hacking"|D3(Leak on Google)
  D2(Service Info) --> E1("HTTP(S)")
  D2(Service Info) --> E2(SMB)
  D2(Service Info) --> E3(SNMP)
  E1("HTTP(S)") -->|"dirsearch"|F1(Subdirectory)
  E1("HTTP(S)") -->|"feroxbuster"|F1(Subdirectory)
  E1("HTTP(S)") -->|"gobuster"|F1(Subdirectory)
  E1("HTTP(S)") -->|"nikto"|F2(Vuln Info)
  E1("HTTP(S)") -->|"nuclei"|F2(Vuln Info)
  E1("HTTP(S)") -->|"wapiti"|F2(Vuln Info)
  E1("HTTP(S)") -->|"webpwn3r"|F2(Vuln Info)
  E1("HTTP(S)") -->|"whatweb"|F3(Fingerprint)
  E1("HTTP(S)") -->|"wafw00f"|F3(Fingerprint)
  E1("HTTP(S)") -->|"wappalyzer"|F3(Fingerprint)
  E1("HTTP(S)") -->|"sslscan"|F4(Crypto Enable Info)
  E2(SMB) -->|"enum4linux"|F5(Samba Info)
  E2(SMB) -->|"smbclient"|F5(Samba Info)
  E2(SMB) -->|"smbmap"|F5(Samba Info)
  E3(SNMP) -->|"snmpwalk"|F6(SNMP Info)
  E3(SNMP) -->|"onesixtyone"|F6(SNMP Info)
```

```mermaid
graph TD

  style Test1 stroke:red,stroke-width:4px
  style Test2 stroke:red,stroke-width:4px,stroke-dasharray: 5 5
  Test1(Done)
  Test2(Building)
```

## Single Component Description

```mermaid
graph LR

  style A stroke-width:4px
  style B stroke-width:4px
  style C stroke-width:4px
  style D stroke-width:4px
  style E stroke-width:4px
  style F stroke-width:4px
  A("
  Json File
  <br>
  {\x22domain\x22:\x22aaa.com\x22}
  <br>
  ex. domain.json
  ") -->B("
  Shell Script
  <br>
  Run container by domain.json
  <br>
  ex. front_whois.sh
  ")-->|Commands<br>Args|C("
  Container
  <br>
  Output result
  <br>
  ex. whois
  ")-->|Raw Data|D("
  Shell Script
  <br>
  Convert the result to json format
  <br>
  ex. back_whois.sh
  ")-->E("
  Json File
  <br>
  {\x22whois\x22:{\x22results\x22:\x22...\x22}}
  <br>
  ex. whois.json
  ")
  D-->F("Raw Data<br>ex. whois.txt")
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

./subdomain.sh
chmod +x ./subdomain_live.sh && ./subdomain_live.sh
cp ./treasure/subdomain_live.txt ./dnsrecon/
cp ./treasure/subdomain_live.txt ./dig/
docker compose -f ./docker-compose.dns_info.yml up

cp ./treasure/subdomain_live.txt ./gau/
cp ./treasure/subdomain_live.txt ./waybackurls/
docker compose -f ./docker-compose.internet_history.yml up

cp ./treasure/subdomain_live.txt ./git-hound/
docker compose -f ./docker-compose.github_secret.yml up

cp ./treasure/subdomain_live.txt ./nmap/
docker compose -f ./docker-compose.service_info.yml up
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
- [X] nmap
- [ ] wapiti
- [ ] arjun
- [ ] goohak
- [ ] dirsearch
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
- [ ] onesixtyone
- [ ] redis-tools
- [ ] smbclient
- [ ] smbmap
- [ ] snmpwalk
- [ ] sslscan
- [ ] whatweb
- [ ] wappalyzer

## Ref

### Github

<img src="https://cdn-icons-png.flaticon.com/512/270/270798.png" width="100" height="100">

- https://github.com/OWASP/Amass
- https://github.com/eslam3kl/3klCon
- https://github.com/projectdiscovery/subfinder
- https://github.com/tomnomnom/assetfinder
- https://github.com/infosec-au/altdns
- https://github.com/aboul3la/Sublist3r
- https://github.com/crtsh
- https://github.com/darkoperator/dnsrecon
- https://github.com/Tib3rius/AutoRecon
- https://github.com/itchyny/gojq
- https://github.com/spali/go-xq

### Dockerhub

<img src="https://cdn-icons-png.flaticon.com/512/5969/5969059.png" width="100" height="100">

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

#### Check container is running

- return `true` is running

```bash
docker container inspect -f '{{.State.Running}}' $container_name
```

### Nmap

#### State

- Open: Firewall and host ports are opened.
- Closed: Firewall ports are opened but host ports are closed.
- Filtered: Firewall ports are filtered.
- Not shown: * closed ports: There isn't have any services.

<!--

### Kubernetes

<img src="https://upload.wikimedia.org/wikipedia/labs/thumb/b/ba/Kubernetes-icon-color.svg/2110px-Kubernetes-icon-color.svg.png" width="100" height="100">

#### Kops
- https://github.com/kubernetes/kops

#### Minikube
- https://github.com/kubernetes/minikube

#### Argo

<img src="https://cncf-branding.netlify.app/img/projects/argo/icon/color/argo-icon-color.png" width="100" height="100">

- https://github.com/argoproj/argo-workflows

-->

## Donate☕

<a href="https://www.buymeacoffee.com/astroicers" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
