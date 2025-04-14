## ✨ Pengenalan Cubit
Cubit adalah versi sederhana dari pola BLoC. Cubit dirancang supaya lebih mudah dipelajari dan digunakan, terutama untuk kebutuhan manajemen state yang nggak terlalu kompleks.
Kalau di BLoC kita harus bikin event, di Cubit cukup pakai method langsung untuk mengubah state. 🎯

![Cubit & Bloc Concept](https://prismic-io.s3.amazonaws.com/createthrive/2dffcab4-f976-4fa4-b42e-780cef4cde83_image-example4.jpg "BLoc Concept")

### 🔄 Perbedaan Utama antara BLoC dan Cubit
🧱 BLoC:
➡️ Menggunakan event sebagai input.
➡️ Event dikirim ke BLoC, diproses, lalu menghasilkan state baru.

🪄 Cubit:
➡️ Menggunakan method sebagai input.
➡️ UI langsung memanggil method di Cubit untuk mengubah state.

📌 Cubit ini cocok banget buat kasus yang sederhana. Tapi kalau aplikasimu butuh menangani banyak jenis input yang berbeda, BLoC bisa jadi pilihan yang lebih fleksibel.

#

#### 🧠 Konsep Inti dari Cubit
📦 **State:** Sama seperti di BLoC, ini adalah data yang ditampilkan oleh UI. Bersifat immutable (tidak bisa diubah langsung).

🌀 **Cubit:** Bertanggung jawab mengatur state. Di dalamnya ada berbagai method yang bisa digunakan untuk memperbarui dan emit state baru ke UI.

🖼️ **UI:** Mengamati state yang di-emit oleh Cubit dan memperbarui tampilannya. UI juga memanggil method Cubit ketika ada interaksi dari pengguna.

#

#### 🚀 Bagaimana Cubit Menyederhanakan State Management
✅ Tanpa Event:
Nggak perlu repot bikin dan ngatur event lagi. Simpel dan langsung to the point.

✅ Update State Secara Langsung:
Cubit lebih intuitif, karena kita tinggal panggil method → update state.

✅ Lebih Ringkas:
Kode jadi lebih bersih dan cepat diimplementasikan karena minim boilerplate.

#

#### 🧪 Contoh Cubit di Dunia Nyata
##### 1️⃣ Counter App
📊 Aplikasi hitung angka sederhana.

- State: CounterState → nyimpan nilai saat ini.

- Cubit: CounterCubit → punya method increment() & decrement().

- UI: Nampilin angka dari CounterState, dan memanggil increment() atau decrement() saat tombol ditekan.

####

##### 2️⃣ Theme Switcher
💡 Aplikasi yang bisa ganti tema terang ↔ gelap.

- State: ThemeState → nyimpan mode tema sekarang (light/dark).

- Cubit: ThemeCubit → method toggleTheme() buat ganti mode.

- UI: Switch button yang mencerminkan tema saat ini dan memanggil toggleTheme() saat digeser.

####

##### 3️⃣ Form Sederhana (Hipotetik)
📝 Formulir dengan satu input teks.

State: FormState → nyimpan isi text field.

Cubit: FormCubit → method updateText(String text).

UI: TextField yang nunjukin isi dari FormState dan memanggil updateText() pas user ngetik.