1. cat /etc/apt/sources.list
2. sudo apt update
3. apt show build-essential or for old versions apt-cache show build-essential
4. sudo apt install build-essential
```bash
The following additional packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu dpkg-dev fakeroot g++ g++-12 gcc
  gcc-12 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan8 libbinutils libc-dev-bin libc-devtools libc6-dev libcc1-0 libcrypt-dev
  libctf-nobfd0 libctf0 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-12-dev
  libgprofng0 libitm1 liblsan0 libnsl-dev libstdc++-12-dev libtirpc-dev libtsan2
  libubsan1 linux-libc-dev make manpages-dev rpcsvc-proto
Suggested packages:
  binutils-doc debian-keyring g++-multilib g++-12-multilib gcc-12-doc gcc-multilib
  autoconf automake libtool flex bison gdb gcc-doc gcc-12-multilib gcc-12-locales
  glibc-doc bzr libstdc++-12-doc make-doc
The following NEW packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential dpkg-dev fakeroot
  g++ g++-12 gcc gcc-12 libalgorithm-diff-perl libalgorithm-diff-xs-perl
  libalgorithm-merge-perl libasan8 libbinutils libc-dev-bin libc-devtools libc6-dev
  libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libdpkg-perl libfakeroot
  libfile-fcntllock-perl libgcc-12-dev libgprofng0 libitm1 liblsan0 libnsl-dev
  libstdc++-12-dev libtirpc-dev libtsan2 libubsan1 linux-libc-dev make manpages-dev
  rpcsvc-proto
  
 0 upgraded, 38 newly installed, 0 to remove and 22 not upgraded
```
5. dimonlimon@vbox:~$ apt-cache search "clone with a bastard algorithm"
bastet - ncurses Tetris clone with a bastard algorithm
6. `mkdir -p ~/src_package` ; `cd ~/src_package`
apt-get source bastet
```bash
dimonlimon@vbox:~/src_package$ ls
bastet-0.43  bastet_0.43-7.debian.tar.xz  bastet_0.43-7.dsc  bastet_0.43.orig.tar.gz
```
7. cd bastet-0.43
sudo apt-get install libncurses-dev
make
./bastet
7. apt-get source bastet
8. nano Makefile
in Makefile:
```bash
install:
        install -m 755 bastet /usr/local/bin
```
sudo make all
sudo make install
ls -l /usr/local/bin/bastet
output: 
```bash
-rwxr-xr-x 1 root root 693120 Feb 28 18:33 /usr/local/bin/bastet
```
now program `bastet` can be executed by simply entring `bastet` in terminal

9. sudo adduser testuser
su - testuser
bastet (works fine)
exit

10. dpkg --get-selections > task10.log # cat task10.log | less
11. apt-cache depends gcc > task11.log # cat task11.log
12. apt-cache rdepends libgpm2 > task12.log
13. sudo -i
mkdir -p /root/localrepo
cd /root/localrepo

- wget https://snapshot.debian.org/archive/debian/20250209T210016Z/pool/main/h/htop/htop_3.3.0-5_amd64.deb
- wget https://snapshot.debian.org/archive/debian/20240129T091021Z/pool/main/h/htop/htop_3.3.0-4_amd64.deb
- wget https://snapshot.debian.org/archive/debian/20230227T025930Z/pool/main/h/htop/htop_3.2.2-2_amd64.deb
- wget https://snapshot.debian.org/archive/debian/20210215T145637Z/pool/main/h/htop/htop_3.0.5-5_amd64.deb
- https://snapshot.debian.org/archive/debian/20180217T221625Z/pool/main/h/htop/htop_2.1.0-3_amd64.deb
14. sudo apt-get install dpkg-dev
dpkg-scanpackages --multiversion . /dev/null | gzip -9 > Packages.gz
nano Release
```bash
Label: My Local Repo
Suite: stable
Version: 1.0
Codename: myrepo
Architectures: amd64
Components: main
Description: My local APT repository
```

15. echo "deb [trusted=yes] file:/root/localrepo ./" | sudo tee /etc/apt/sources.list.d/localrepo.list
sudo apt update
```bash
root@vbox:/var/localrepo# echo "deb [trusted=yes] file:/var/localrepo ./" | sudo tee /etc/apt/sources.list.d/localrepo.list
deb [trusted=yes] file:/var/localrepo ./
root@vbox:/var/localrepo# sudo apt update
Get:1 file:/var/localrepo ./ InRelease
Ign:1 file:/var/localrepo ./ InRelease
Get:2 file:/var/localrepo ./ Release
Ign:2 file:/var/localrepo ./ Release
Get:3 file:/var/localrepo ./ Packages
Ign:3 file:/var/localrepo ./ Packages
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Get:3 file:/var/localrepo ./ Packages
Ign:3 file:/var/localrepo ./ Packages
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Get:3 file:/var/localrepo ./ Packages
Ign:3 file:/var/localrepo ./ Packages
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Get:3 file:/var/localrepo ./ Packages [1,265 B]
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Hit:6 http://security.debian.org/debian-security bookworm-security InRelease
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Get:4 file:/var/localrepo ./ Translation-en_US
Ign:4 file:/var/localrepo ./ Translation-en_US
Get:5 file:/var/localrepo ./ Translation-en
Ign:5 file:/var/localrepo ./ Translation-en
Hit:7 http://deb.debian.org/debian bookworm InRelease
Hit:8 http://deb.debian.org/debian bookworm-updates InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
```

16. apt-cache policy > repositories.log
```bash
Package files:
 100 /var/lib/dpkg/status
     release a=now
 500 file:/var/localrepo ./ Packages
     release v=1.0,o=My Local Repo,a=stable,n=myrepo,l=My Local Repo,c=
 500 http://deb.debian.org/debian bookworm-updates/non-free-firmware amd64 Packages
     release v=12-updates,o=Debian,a=stable-updates,n=bookworm-updates,l=Debian,c=non-free-firmware,b=amd64
     origin deb.debian.org
 500 http://deb.debian.org/debian bookworm-updates/main amd64 Packages
     release v=12-updates,o=Debian,a=stable-updates,n=bookworm-updates,l=Debian,c=main,b=amd64
     origin deb.debian.org
```

17. apt-cache madison htop > task16.log (madison better than policy, because it allows to show all versions of a package)
```bash
root@vbox:/var/localrepo# cat task16.log
      htop |    3.3.0-5 | file:/var/localrepo ./ Packages
      htop |    3.3.0-4 | file:/var/localrepo ./ Packages
      htop |    3.2.2-2 | http://deb.debian.org/debian bookworm/main amd64 Packages
      htop |    3.2.2-2 | file:/var/localrepo ./ Packages
      htop |    3.0.5-5 | file:/var/localrepo ./ Packages
      htop | 2.2.0-1+b1 | file:/var/localrepo ./ Packages
      htop |    2.1.0-3 | file:/var/localrepo ./ Packages
      htop |    3.2.2-2 | http://deb.debian.org/debian bookworm/main Sources
```

then i've realised that home directory of a root user is not /root/localrepo and moved it to /var/localrepo 

sudo mkdir -p /var/localrepo
sudo mv /root/localrepo/* /var/localrepo/
sudo rmdir /root/localrepo
echo "deb [trusted=yes] file:/var/localrepo ./" | sudo tee /etc/apt/sources.list.d/localrepo.list # register my NEW (recently moved) local repository )

18. sudo apt install htop=3.0.5-5
```bash
root@vbox:/var/localrepo# sudo apt install htop=3.0.5-5
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libncursesw5 libtinfo5 linux-image-6.1.0-29-amd64
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  lm-sensors strace
The following packages will be upgraded:
  htop
1 upgraded, 0 newly installed, 0 to remove and 24 not upgraded.
Need to get 0 B/127 kB of archives.
After this operation, 98.3 kB of additional disk space will be used.
Get:1 file:/var/localrepo ./ htop 3.0.5-5 [127 kB]
Reading changelogs... Done
(Reading database ... 191253 files and directories currently installed.)
Preparing to unpack ..././htop_3.0.5-5_amd64.deb ...
Unpacking htop (3.0.5-5) over (2.1.0-3) ...
Setting up htop (3.0.5-5) ...
Processing triggers for mailcap (3.70+nmu1) ...
Processing triggers for desktop-file-utils (0.26-1) ...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for gnome-menus (3.36.0-1.1) ...
Processing triggers for man-db (2.11.2-2) ...
root@vbox:/var/localrepo# 
```

19. mkdir nano_task
cd nano_task

sudo apt-get update
sudo apt-get install build-essential devscripts dpkg-dev

apt-get download nano

mkdir nano_extract
dpkg-deb -R nano_*.deb nano_extract (extracting packet)

cd nano_extract/bin
ln -s nano newnano
cd ../..

dpkg-deb -b nano_extract nano_modified.deb

sudo dpkg -i nano_modified.deb

newnano
