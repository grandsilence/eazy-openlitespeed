# Requirements
* CentOS 7
* curl / wget
* Run as root!

# Install
## via curl
```bash
curl -sS https://raw.githubusercontent.com/grandsilence/eazy-openlitespeed/master/install.sh | bash
```
## via wget
```bash
wget --no-check-certificate https://raw.githubusercontent.com/grandsilence/eazy-openlitespeed/master/install.sh | bash
```

## after
```bash
source ~/.bashrc
```

# Configure
## MySQL
```bash
mysql_secure_installation
```
## OpenLiteSpeed Admin Password
```bash
litespeed_reset
```