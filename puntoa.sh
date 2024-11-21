sudo fdisk /dev/sdc
n
p
enter
enter
+1G
n
p
enter
enter
+1G
n
p
enter
enter
+1G
n
e
enter
enter
+3G
n
enter
+1500M
n
enter
+1500M
sudo fdisk /dev/sdc
t
1
L
82
w
sudo mkswap /dev/sdc1
sudo swapon /dev/sdc1
sudo fdisk /dev/sdc
t
2
L
8e
t
3
8e
t
5
8e
t
6
8e
w
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
sudo lvcreate -L 2G vgAdmin -n lvAdmin
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L 900M vgDevelopers -n lvDevops
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkdir /mnt/lvAdmin
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops
