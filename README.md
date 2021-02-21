# Asus ROG Zephyrus Duo 15 SE - Linux Kubuntu Setup - GX551QS-HF038T

* start on Kubuntu Ubuntu 20.04.2 LTS

* install mainline 
```
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline -y
```

* check kernel version, it should be at least 5.10.x choose and install never ketnel then
```
sudo mainline --list
sudo mainline install 5.10.15

```

* install additional packages
```
apt install -y gcc make dkms linux-generic-hwe-20.04 linux-generic-hwe-20.04-edge mesa-utils
```

* install NVIDIA drivers at least ./NVIDIA-Linux-x86_64-460.39.run, do not check cc version as it will fail

```
 ./NVIDIA-Linux-x86_64-460.39.run -no-cc-version-check
```

* At the moment NVIDIA must be the primary GPU if you are planning to use external monitor over USB-C
* It may change in future, but now if amdgpu is primary you have error when  xrandr is  trying to set up that monitor.
* modesetting driver disable ability to use acceleration for desktop and It  I was not able to make it work.
* when amdgpu driver is primary I have a problem in Chrome (open menu will hang for a while, It can be solved with  disabling  HW acceleration)


* replace all files from this repository for /etc and /usr as the last step. 

# TODO
* solve waking up(main monitor is blinking and  brightness is set to minimum)
* keybindings for FN(brightness,..)
* keyboard backlide are on all the time( saddly they are red by default), I would  like to find a way how to turn it off
* react to different AC/DC variants and execute  propper setting
* hide secondary mouse cursor when  touchscreen is on (unclutter and xbanish disable only "Virtual core pointer")
* if possible change cursor for secondary mouse when touch  to some round and animation to fade as under windows.
