script ini adalah automation untuk setup mikbotam dan mikhmon di server ubuntu

requirement
ubuntu16.04 atau 18.04

jika menggunakan raspberry sangat tidak disarankan menggunakan versi 64bit karena ada dependency yang tidak ada di versi ubuntu arm64

raspi 2
http://cdimage.ubuntu.com/ubuntu/releases/18.04/release/ubuntu-18.04.2-preinstalled-server-armhf+raspi2.img.xz

raspi 3
http://cdimage.ubuntu.com/ubuntu/releases/18.04/release/ubuntu-18.04.2-preinstalled-server-armhf+raspi3.img.xz


step:
```
git clone https://github.com/doko89/ansible-raspi-config.git
cd ansible-raspi-config
./setup.sh
```

note:
```
- karena masih belum dapat example db sqlite, jadi mikbotam versi sqlite belum bisa digunakan
- polling bot telegram dijalankan menggunakan service supervisor, jadi jika ada perubahan silahkan restart supervisornya, kalau ngga tau sama sekali cara gampangnya restart aja raspberry/vm nya
```

