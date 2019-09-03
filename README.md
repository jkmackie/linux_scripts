# linux_scripts
*Tested on Ubuntu 18.04 LTS Bionic Beaver*

### Swap Script: Temporarily increase swap file size with enlarge_swap.sh

Server default swap file size on Ubuntu Server 18.04 is 4 Gigabytes.  In contrast, desktop Dell Ubuntu 16.04 allocates
over 30 GB.  The likely assumption is servers enjoy lots of RAM.  But this may be untrue, especially for home-based,
personal servers.

#### <ins>Use Case:</ins>
Tree-based learning algorithms like LightGBM can need a lot of RAM.  For example, fitting the gradient boosting
model with larger training data causes memory usage spikes.  A swap file prevents program termination due to 
insufficient RAM by writing data to the hard disk.

### How to use:
***
Download the file from GitHub and make sure file permission is executable for the owner, typically the superuser "root".
Then run the script.

* **Permissions:** `sudo chmod 700 enlarge_swap.sh`
* **Run script from the script folder:** `sudo ./enlarge_swap.sh`

The script will show available partition space.  If partition space is sufficient for a larger swap file, press any key.
Otherwise, exit the script with "Ctrl-C".  Enter the desired swap size in Gigabytes.  For example, enter "8" for an
8 Gigabyte swap file and press enter.  The swap file will be resized.

<ins>**enlarge_swap.sh screenshot:**</ins>



The change is **temporary**.  Rebooting the system will revert swap size to the default.  The fstab file at /etc/fstab must be
updated to make the change permanent.
