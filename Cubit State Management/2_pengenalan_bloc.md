## Pengenalan BLoC
**BLoC (Business Logic Component)** adalah pola arsitektur yang membantu kamu untuk misahin logika bisnis dari tampilan UI di aplikasi. Dengan pemisahan ini, kode kamu jadi lebih gampang di-test, dirawat, dan dipakai ulang.

Cubit adalah versi sederhana dari pola BLoC yang lebih mudah dipelajari dan digunakan. Kita akan bahas lebih dalam tentang BLoC dan Cubit di pelajaran berikutnya.

### 💡 Memahami Pola BLoC
Pola BLoC berfokus pada konsep memisahkan lapisan presentasi (UI) dari logika bisnis. Pemisahan ini dilakukan lewat alur data satu arah (unidirectional data flow), yang bikin kita lebih gampang memahami state aplikasi dan gimana perubahannya dari waktu ke waktu.

Berikut adalah komponen utama dari pola BLoC:

##### 1. ⚡Events:
Event adalah input untuk BLoC. Ini mewakili aksi atau pemicu dari UI atau bagian lain dari aplikasi yang butuh perubahan state.
Contohnya:
👉 Menekan tombol
👉 Mengirim form
👉 Data datang dari jaringan

Semua itu bisa dianggap sebagai event.
##
##### 2. 🧠 BLoC (Business Logic Component):
BLoC adalah inti dari pola ini. Ia menerima event, memprosesnya, dan mengeluarkan state baru.
Di sinilah logika bisnis ditempatkan — menentukan bagaimana state harus berubah sebagai respon dari event yang diterima.

##
##### 📦 State:
State adalah data yang ditampilkan oleh UI. Ia bersifat immutable alias nggak bisa diubah langsung, tapi selalu diganti dengan versi barunya.
🔁 Jadi, setiap kali BLoC memproses event, dia bisa memperbarui dan meng-emit/merubah state baru ke UI.
##
##### 4. 🖥️ UI (User Interface):
UI akan memantau state yang dikeluarkan oleh BLoC dan akan menyesuaikan tampilannya sesuai dengan perubahan tersebut.
Selain itu, UI juga bertugas mengirimkan event ke BLoC sebagai respon dari interaksi pengguna.

#
#

Berikut adalah gambar konsep bloc :

![BLoC Concept](https://raw.githubusercontent.com/felangel/bloc/master/assets/diagrams/bloc_architecture.png "BLoc Concept")

#### 🔁 Alur Data Satu Arah
Dalam pola BLoC, alur data berjalan satu arah, artinya data hanya mengalir dari satu arah saja:
📤 Dari UI ke BLoC (melalui event) dan
📥 Dari BLoC ke UI (melalui state).

Hal ini membuat alur data jadi lebih mudah dilacak dan kita bisa lebih gampang memahami gimana perubahan di satu bagian aplikasi bisa memengaruhi bagian lainnya. ✅

Berikut rincian alur data satu arah:
###
1. 👆 Interaksi Pengguna
Pengguna berinteraksi dengan UI (misalnya menekan tombol).
######
2. 📮 Pengiriman Event
UI akan mengirimkan event ke BLoC.
######
3. 🧠 Pemrosesan Event
BLoC menerima event dan memprosesnya sesuai dengan logika bisnis yang sudah dibuat.
######
4. 🛠️ Perubahan State
Berdasarkan event tersebut, BLoC akan memperbarui state aplikasi.
######
5. 📢 Emit State Baru
Setelah diproses, BLoC akan meng-emit state baru.
######
6. 🖼️ Update UI
UI akan mengamati state yang baru, lalu me-render ulang tampilannya agar sesuai dengan perubahan.

-----