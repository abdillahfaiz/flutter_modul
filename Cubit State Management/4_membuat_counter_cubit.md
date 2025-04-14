## 📌 Membuat Counter Cubit
Bikin Cubit itu langkah dasar buat mulai pakai pola state management Cubit di Flutter. Intinya, kita bikin sebuah class yang nyimpen state aplikasi, lalu di dalamnya ada method-method buat ngubah state tersebut.

Di materi ini, kita bakal bareng-bareng bikin CounterCubit, yang nanti jadi pondasi buat bikin aplikasi counter sederhana.
Kenapa ini penting? Karena paham cara bikin Cubit itu kunci biar kita bisa ngatur state di Flutter dengan rapi, terstruktur, predictable, dan gampang di-test.
##
### ✅ Definisi Cubit Class
Secara simpel, Cubit itu sebuah class yang extend dari Cubit class bawaannya package flutter_bloc.
Class ini bertugas buat ngatur state dari bagian tertentu di aplikasi kita.
Karena kita mau bikin counter, berarti Cubit-nya bakal ngatur nilai int dari counter itu.
##
### ✅ Struktur Dasar Cubit
Struktur dasar CounterCubit itu:

- Import dulu package flutter_bloc

- Extend Cubit class, sambil tentuin tipe datanya (misal: int)

- Kasih nilai state awal di constructor

Contoh:
```dart
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // State awalnya 0
}
```
##### Penjelasan:
- ```import 'package:flutter_bloc/flutter_bloc.dart';```
→ ini buat manggil package flutter_bloc supaya kita bisa pakai Cubit-nya.
####
- ```class CounterCubit extends Cubit<int>```
→ kita bikin class namanya CounterCubit yang extend Cubit, dengan tipe data state-nya int.
####
- ```CounterCubit() : super(0);```
→ ini constructor-nya, sekaligus ngasih nilai awal ke state, yaitu 0.
##
### ✅ Aturan Penamaan Cubit
Walaupun gak wajib, biasanya class Cubit dikasih akhiran Cubit, contoh:

- ```CounterCubit```

- ```UserCubit```

- ```SettingsCubit```

Tujuannya biar gampang dikenali kalau class itu ngatur state.
##
### ✅ State Awal Cubit
State awal itu penting banget, karena jadi posisi pertama aplikasi sebelum terjadi perubahan apapun.
Waktu nentuin state awal, kamu bisa mikirin:

- **Nilai default:**
Contoh: kalo counter ya 0, kalo list ya [].
####
- **Data loading:**
Misal Cubit-nya buat fetch data, state awal bisa kayak “loading” atau kosong.
####
- **Jenis data:**
Tipe state awal harus sesuai sama tipe Cubit-nya.
Kalau Cubit<int>, ya harus angka.
##
### ✅ Cara Ubah State
Tujuan utama Cubit itu buat ngatur perubahan state.
Caranya tinggal:

- Bikin method di dalam Cubit

- Method itu ubah state dan panggil ```emit()``` buat ngasih tau listener kalau state-nya udah berubah.

#### 📌 Method emit()
```emit()``` ini method bawaan dari Cubit, fungsinya:

- Kasih info ke listener (biasanya UI) kalau state-nya udah berubah.

- Begitu emit() dipanggil, semua listener Cubit bakal rebuild UI pake state baru.
##
### Contoh: Method Increment & Decrement
Kita coba implement increment() sama decrement() di CounterCubit:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
     emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  } 
}
```

##### Penjelasan:

- ```void increment() => emit(state + 1);```
→ method buat nambah state 1 angka, lalu emit() state baru.

- ```void decrement() => emit(state - 1);```
→ method buat ngurangin state 1 angka, lalu emit() state baru.