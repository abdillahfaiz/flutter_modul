## 📱 Contoh Implementasi UI CounterCubit
#### ✅ 1. Import yang Diperlukan
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'counter_state.dart';
```
#### ✅ 2. Buat CounterPage (Widget-nya)
Ini contoh tampilan sederhana — ada angka, tombol tambah, kurang, dan reset.

```dart
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Cubit 🚀'),
        ),
        body: const CounterView(),
      ),
    );
  }
}
```
📌 Keterangan

- ```BlocProvider``` buat nyediain CounterCubit ke seluruh widget di bawahnya

- ```CounterView``` adalah widget isiannya, kita buat di bawah 👇

### ✅ 3. Buat CounterView (Isiannya)
```dart
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Angka Saat Ini 👇',
            style: TextStyle(fontSize: 20),
          ),

          // Nampilin angkanya
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            },
          ),

          const SizedBox(height: 20),

          // Tombol-tombolnya
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => context.read<CounterCubit>().decrement(),
                icon: const Icon(Icons.remove),
                label: const Text('Kurang'),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () => context.read<CounterCubit>().increment(),
                icon: const Icon(Icons.add),
                label: const Text('Tambah'),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () => context.read<CounterCubit>().reset(),
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```
📌 Penjelasan
  #### ✨ ```BlocBuilder<CounterCubit, CounterState>```

- Widget ini akan rebuild hanya saat state berubah

- Menampilkan state.counterValue yang berasal dari Cubit

#### ✨ Tombol onPressed

- Manggil method di CounterCubit increment(), decrement(), reset()
##
#### ✅ Full Jalannya
- CounterCubit → ngatur logika perubahan state

- BlocProvider → nyediain cubit ke widget

- BlocBuilder → rebuild UI kalau state berubah

- Tombol → trigger function Cubit

- Angka → update otomatis tiap kali state berubah

#### 🎉 Berhasil!
Sekarang kamu udah punya: 
✅ State → CounterState
✅ Cubit → CounterCubit
✅ UI → CounterPage + CounterView