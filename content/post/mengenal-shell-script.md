---
title: "Mengenal Shell Script"
date: 2020-02-09T00:50:19+07:00
tags: ['linux', 'programming', 'tutorial']
draft: false
---

## Pengenalan Shell Scripting
Shell script adalah bahasa yang digunakan oleh **shell** pada sistem operasi berbasis *UNIX* atau *UNIX-like* seperti linux, bsd, dan semacamnya untuk melakukan berbagai rangkaian perintah, seperti untuk keperluan automatisasi pekerjaan yang berulang atau pembuatan program atau perintah baru

```bash
#!/bin/sh
# ini Comment!
echo Hello World        # ini juga comment!
```

File yang berisi shell script biasanya diakhiri dengan extensi "**\*.sh**" (***tetapi tidak wajib***), dan pada baris pertama nya harus terdapat **shebang**, yaitu karakter "**#!***" diikuti dengan path executable shell yang ada pada komputer \*-nix kita.

Pada os GNU/Linux umumnya path tersebut berada di `/bin/sh` dan merupakan sebuah symlink terhadap **bash**, **bash** atau *Bourne Again Shell* adalah shell yang banyak dipakai dan menjadi standar shell default pada distribusi-distribusi linux saat ini

## Variable
Sama seperti bahasa pemograman yang lain, shell script juga mempunyai istilah **variable** yaitu suatu wadah yang diberi nama untuk menampung nilai yang nantinya nilai tersebut dapat dibaca, diubah, dan dimanupulasi

```bash
#!/bin/sh

VARIABLE1=halo # TIDAK BOLEH ADA SPASI DIANTARA "="
echo $VARIABLE1 # halo

VARIABLE2="halo dunia"
echo $VARIABLE2 # halo dunia
```

Pada contoh diatas menunjukan bahwa, <mark>pendefinisian variable tidak boleh menggunakan spasi sebelum dan sesudah tanda "="</mark>. Sebuah variable juga hanya bisa menampung satu nilai, karena pada dunia UNIX semuanya dipisahkan oleh spasi untuk membuat perintah, maka <mark>maka untuk menyimpan nilai yang mengandung *white space* (spasi, tab dan semacamnya), nilai variable tersebut harus ada didalam petik 2 (")</mark>. petik 2 juga berguna untuk hal lain seperti menampilkan nilai sebagai apa adanya untuk beberapa karakter (kecuali $,",\`,\\),

``` bash
#!/bin/sh

NAMA=nito
echo "konnichiwa ${NAMA}-san!" # konnichiwa nito-san
```

Jika kita ingin menggabungkan nilai dari variable dengan text **string** atau dengan command lain, variable tersebut <mark>harus dikelilingi oleh **${}** atau untuk menghindari terjadinya ambiguitas antara command lain</mark> saat shell meng-intrepretasi script kita

### Mengisi Nilai Variable Dari Input
Tidak seperti bahasa pemograman C, java, dan semacamnya, variable yang ada pada shell script tidak perlu di deklarasikan terlebih dahulu, variable yang dipanggil tanpa mempunyai nilai tidak akan menampilkan error melainkan nilai variable tersebut akan menjadi "" atau *empty string*

``` bash
#!/bin/sh

echo $UNDEFINED # 
UNDEFINED="now defined"
echo $UNDEFINED # now defined
```

Dengan command `read`, kita bisa membuat shell menerima input dari pengguna, nantinya input tersebut akan di simpan ke dalam sebuah variable

``` bash
#!/bin/sh

echo "Masukan nama"
read $NAMA
echo "Halo $NAMA selamat siang"
```

### Mengisi Nilai Variable Dari Output Sebuah Command (*stdout*)
Sebuah variable dapat diisi secara dinamis dari output (*stdout*) sebuah perintah lain menggunakan **backtick** (\`) yaitu karakter diatas tombol TAB dan sebelak kiri tombol 1, atau menggunakan **$()**

``` bash
#!/bin/sh

LIST=`ls ~/Documents/`
FileWithTimeStamp=~/Documents/file_$(/bin/date +%Y-%m-%d).txt
```

Pada contoh diatas nilai dari variable **LIST** adalah hasil output dari command `ls` dari directory "Documents", begitupun juga dengan variable **FileWithTimeStamp** yang akan menjalankan command `/bin/date +%Y-%m-%d` untuk mendapatkan file terbaru dengan format tanggal tertentu
