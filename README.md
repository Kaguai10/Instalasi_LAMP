<div align="center">
  <img src="https://readme-typing-svg.herokuapp.com?size=33&color=e51938&center=true&vCenter=true&width=600&lines=Instalasi+LAMP+Di+Debian">
</div>

## Apa Itu LAMP?

LAMP stack adalah kumpulan perangkat lunak sumber terbuka yang digunakan untuk pengembangan dan hosting aplikasi web. Stack ini terdiri dari sistem operasi , server web , sistem manajemen basis data, dan bahasa pemrograman. LAMP memiliki semua sumber daya yang dibutuhkan pengembang untuk membangun dan menjalankan situs web dan aplikasi web dinamis. 

LAMP Terdiri dari beberapa komponen Yaitu:
| Komponen  | Keterangan                                                                            |
| --------- | ------------------------------------------------------------------------------------- |
| Linux     | Sistem operasi dasar yang stabil dan aman, menjadi pondasi untuk semua komponen lain. |
| Apache    | Server HTTP yang menangani permintaan dan menyajikan halaman web.                     |
| MariaDB   | Sistem Manajemen Basis Data yang digunakan untuk menyimpan dan mengambil data.        |
| PHP       | Bahasa pemrograman yang terutama digunakan untuk scripting sisi server.               |

## langkah Konfigurasi

Repository ini berisi panduan instalasi LAMP (Linux, Apache, MariaDB, dan PHP) pada sistem operasi berbasis Debian. Sebelum masuk ke proses instalasi LAMP, langkah pertama yang perlu dilakukan tentu saja adalah menginstal sistem operasi Linux. Pada panduan ini saya menggunakan Debian sebagai contoh. Kalian juga bisa mengikutinya jika memakai Debian ataupun distro turunannya, seperti Ubuntu, Linux Mint, MX Linux, dan lain-lain. Kalau sistem operasi Linux yang kalian butuhkan sudah terpasang, berarti kalian sudah menyelesaikan tahap pertama Yaitu menginstal Linux. 

Jika kalian belum menginstal sistem operasi Linux, kalian bisa memasangnya terlebih dahulu sebagai langkah awal. Setelah OS terpasang, disarankan untuk melakukan update atau bahkan upgrade. Tujuannya agar sistem kalian dapat menyinkronkan repositori, serta memastikan semua paket dan dependensi berada pada versi terbaru. Untuk mengupdate dan mengupgradenya terlebih dahulu kalian bisa masuk sebagai user root dan menjalankan command ini:
```bash
apt-get update #Untuk Mengupdate
apt full-upgrade -y #Untuk Mengupgrade Package
```
Selanjutnya, kalian dapat menginstal Apache. Apache adalah perangkat lunak web server yang bersifat gratis dan open-source, serta menjadi salah satu yang paling populer di dunia. Fungsinya adalah sebagai “penjaga gerbang” yang menyajikan halaman dan konten situs web ke browser pengguna melalui internet. Apache menerima permintaan (request), memprosesnya, dan kemudian mengirimkan kembali respons (response). Kalian dapat menginstallnya dengan command ini:
```bash
apt install apache2 apache2-utils -y
```

Jika proses instalasi sudah selesai, kalian bisa mengecek apakah Apache sudah aktif dan berjalan dengan command `systemctl status apache2`. Jika ternyata belum berjalan, kalian dapat memulainya dengan menggunakan `systemctl start apache2`, lalu mengaktifkannya agar otomatis berjalan saat boot dengan `systemctl enable apache2`. Setelah Apache aktif, coba akses alamat IP server kalian melalui browser. Jika muncul halaman default Apache, berarti instalasi Apache berhasil dilakukan.

Selanjutnya kita akan menginstall MariaDB. MariaDB adalah Relational Database Management System (RDBMS) yaitu sistem perangkat lunak untuk membuat, mengelola, dan memanipulasi basis data relasional. MariaDB merupakan sumber terbuka (open-source) dan gratis, yang merupakan fork (pengembangan lanjutan) dari MySQL, dibuat oleh pengembang asli MySQL untuk memastikan keberlanjutan dan pengembangan independen setelah MySQL diakuisisi Oracle. Untuk penginstallannya kalian dapat menulis command ini:

```bash
apt install -y mariadb-server mariadb-client
```
setelah penginstallan selesai kalian bisa set-up database kita dengan command `mysql_secure_installation` disini kalian input password untuk root lalu saat kalian diminta untuk mengubah kata sandi user root database tekan n. dan tekan 'y' terus hingga selesai. sebagai contoh:
```txt
#Enter the root database user password you set earlier and press Enter.
Enter password for user root:

#Enter Y when prompted to setup the VALIDATE PASSWORD component.
Would you like to setup VALIDATE PASSWORD component?
Press y|Y for Yes, any other key for No: Y

#Enter N when prompted to change the root database user password, or enter Y to change the password.
Change the password for root ? (Press y|Y for Yes, any other key for No) : N

#Enter Y when prompted to remove anonymous users from MySQL.
Remove anonymous users? (Press y|Y for Yes, any other key for No) : Y

#Enter Y when prompted to disallow remote login for the root user.
Disallow root login remotely? (Press y|Y for Yes, any other key for No) : Y

#Enter Y when prompted to remove the test database from your MySQL database server.
Remove test database and access to it? (Press y|Y for Yes, any other key for No) : Y

#Enter Y to reload the MySQL privileges table and apply all configuration changes.
Reload privilege tables now? (Press y|Y for Yes, any other key for No) : Y
```
Jika set-up database sudah selesai, kalian bisa masuk ke MariaDB menggunakan command `mysql`. Jika ingin login sebagai user root, kalian bisa menambahkan opsi '-u root', sehingga perintahnya menjadi `mysql -u root`. Apabila kalian diminta untuk memasukkan password, cukup masukkan password yang telah kalian buat saat konfigurasi sebelumnya.

Setelah penginstallan database MariaDB kita selesai kita bisa melanjutkan penginstallan dan pemasangan bahasa pemograman PHP. Dengan menggunakan command ini:
```bash
apt install php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath -y
```

Jika proses instalasi PHP sudah selesai, kalian bisa memastikan bahwa PHP berjalan dengan baik dengan membuat file sederhana menggunakan perintah berikut:
```bash
echo '<?php phpinfo(); ?>' > /var/www/html/info.php
```
Setelah itu, buka browser dan kunjungi alamat IP server kalian, lalu tambahkan /info.php. Sebagi contoh: http://192.168.0.2/info.php. Jika halaman PHP Info muncul, berarti PHP berhasil terinstal dan berjalan dengan baik. Dan installasi LAMP kalian telah berhasil dan selesai, Selamat mencoba😊.
