---
title: "SysRq, Tombol Ajaib Yang Ada Di Linux"
date: 2020-02-09T17:34:52+07:00
tags: ['linux','tips&tricks']
---

## Magic SysRq Key

Dulu saat masih menggunakan OS sebelah, laptop saya sering mengalami yang namanya ngehang atau ngadat, disaat hal itu terjadi biasanya yang saya lakukan adalah menekan kombinasi tombol spesial yang terdiri dari **Ctrl**+**Alt**+**Del** untuk memanggil Task Manager agar saya bisa meng-kill aplikasi-aplikasi yang bikin laptop saya lemot, atau malah memilih pilihan **Reboot** kalu kondisi ngehangnya memang benar-benar sudah parah.

Semenjak pindah ke OS Linux saya sempat kangen dengan fitur tersebut, tombol ajaib yang bisa membebaskan laptop dari keadaan ngadat, sampai akhirnya saya menemukan sebuah istilah yang disebut **SysRq** dari [ArchWiki](https://wiki.archlinux.org/index.php/Keyboard_shortcuts#Kernel).

Di Linux tombol **SysRq** atau **PrtSc** (*printscreen*) pada keyboard dapat digunakan untuk mengirim perintah langsung kepada kernel. Yang artinya hal ini dapat digunakan **untuk men-recover atau restart device ber-os linux dengan aman jika sistem mengalami freeze atau *not responding***

{{< note >}}
Perintah yang dikirim akan selalu ditangkap mau separah apapun hang atau freeze yang terjadi di os linux kita, selama tidak terjadinya kerusakan pada level kernel atau <b>Kernel Panic</b>
{{< /note >}}

## Cek dan Enable SysRq Key

Kadang-kadang penggunaan key **SysRq** tidak di enable secara default, untuk mengecek nya bisa dengan:
{{< cmd >}}
cat /proc/sys/kernel/sysrq
{{< /cmd >}}

Jika output yang keluar **bukan 1**, maka harus di enable dulu dengan cara:
``` bash
sysctl kernel.sysrq=1
```
atau

{{< cmd >}}
echo "1" > /proc/sys/kernel/sysrq
{{< /cmd >}}

Hal diatas akan kembali di reset ke nilai yang sebenarnya setelah komputer di restart. Untuk merubah sifat berikut bisa dengan menambahkan opsi pada *kernel parameter*, dengan cara:

{{< cmd >}}
echo "kernel.sysrq = 1" >> /etc/sysctl.d/99-sysctl.conf
{{< /cmd >}}

## REISUB

Ada sebuah command yang paling sering digunakan untuk me-restart paksa komputer kita saat terjadinya *freeze*, tanpa membahayakan harddisk dari komputer dengan cara di unmount terlebih dahulu.

Command ini merupakan kombinasi keys yang ditekan sambil menahan tombol **Alt+SysRq** pada keyboard

{{< note >}}
Untuk keyboard pada laptop yang rata-rata hanya memiliki tombol <b>PrtSc</b>, dan yang memiliki tombol <b>SysRq</b> dengan menahan tombol <b>Fn</b>. Command ini tetap bisa berfungsi dengan tombol <b>PrtSc</b> (tidak perlu sambil menahan <b>Fn</b>)
{{< /note >}}

Yakni **Alt+SysRq+REISUB** (r+e+i+s+u+b sambil menahan alt dan sysrq/printscreen)

Yang jika dijabarkan memiliki fungsi dan arti masing-masing yaitu:

|Keyboard Shortcut |	Description  |
------------------ |-------------------
`Alt+SysRq+r` Un**R**aw  |	Take control of keyboard back from X.
`Alt+SysRq+e` T**E**rminate	| Send SIGTERM to all processes, allowing them to terminate gracefully.
`Alt+SysRq+i` K**I**ll	| Send SIGKILL to all processes, forcing them to terminate immediately.
`Alt+SysRq+s` **S**ync	| Flush data to disk.
`Alt+SysRq+u` Unmo**U**nt	| Unmount and remount all filesystems read-only.
`Alt+SysRq+b` Re**B**oot	| Reboot

<small style="position: relative; bottom: 40px; font-style: italic;">Tabel berikut diambil dari [ArchWiki](https://wiki.archlinux.org/index.php/Keyboard_shortcuts#Kernel).</small>

Kalu ingin di **shutdown** dari pada di **reboot** maka **b** pada REISUB bisa diganti dengan **o** yang artinya power off. Sehingga menjadi **Alt+SysRq+REISUO**
