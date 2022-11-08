# Tugas 7

### Widget di Flutter

_Referensi penjelasan bagian ini adalah link [berikut](https://docs.flutter.dev/development/ui/interactive)._

Di Flutter, ada 2 macam _widget_, yaitu _stateless_ dan _stateful_. _Stateless widget_ adalah komponen Flutter yang statis sehingga tidak akan mengalami perubahan ketika berinteraksi dengan _user_. Konsep ini berbeda dengan _stateless widget_ yang justru ditujukan untuk berubah ketika suatu _event_ terjadi.

### Widget pada Tugas Ini

Untuk mengerjakan tugas ini, saya memakai _widget_ berikut:

- `Column()`, untuk menata elemen secara vertikal,
- `Row()`, untuk menata elemen secara horizontal,
- `Text()`, untuk membuat teks di layar,
- `Padding()`, untuk menambah _padding_ pada elemen,
- `FloatingActionButton()`, untuk menambah elemen berubah tombol pada bagian bawah layar, dan
- `Expanded()`, untuk mengambil semua _space_ yang tersedia di bagian tulisan genap/ganjil dan angka _counter_, sehingga bahwa tombol _increment_ dan _decrement_ terdorong ke bagian bawah layar.

### `setState()`

Fungsi ini pada akan mengubah data yang ada pada program dan efeknya akan terlihat pada layar. Misalnya ketika _user_ memencet tombol _increment_, maka variabel `_counter` akan bertambah dan layar akan menunjukkan nilai `_counter` yang telah ditambah dengan 1. Fungsi ini dapat meningkatkan elemen dinamis aplikasi, sehingga lebih interaktif dengan _user_.

### `const` vs `final`

_Referensi pada bagian ini diperoleh dari link [berikut](https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart)._

`const` dan `final` adalah beberapa contoh _reserved keyword_ yang dimiliki bahasa Flutter, yaitu Dart. `const` dapat digunakan jika nilai akhir suatu variabel diperoleh pada saat _compile time_, sementara `final` dapat digunakan jika nilai akhir suatu variabel diperoleh pada saat _run time_.

### Implementasi _Checklist_ pada Tugas Ini

1. Membuat program Flutter bernama `counter_7`<br>
   Untuk mengerjakan bagian ini, saya menjalankan perintah `flutter create counter_7` pada terminal di _folder_ tempat saya ingin meletakkan _project_ ini.

2. _Handle display_ genap/ganjil<br>
   Untuk mengerjakan bagian ini, saya membuat _children_ dari `Column()` sebagai berikut:

   ```dart
   children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _counter % 2 == 0
                      ? const Text(
                          'GENAP',
                          style: TextStyle(color: Colors.red),
                        )
                      : const Text(
                          'GANJIL',
                          style: TextStyle(color: Colors.blue),
                        ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
   ```

   Jika `_counter` bernilai genap, maka `Text()` dengan teks "GENAP" akan ditampilkan, sedangkan jika ganjil, maka teks "GANJIL" akan ditampilkan di atas nilai `_counter` saat ini.

3. _Handle logic increment_ dan _decrement_<br>
   Untuk mengerjakan bagian ini, saya menggunakan _method_ `_increment` yang sudah disediakan ketika menjalankan perintah awal untuk membuat _project_, kemudian memodifikasinya untuk _method_ `_decrement`. Saya memastikan bahwa `_counter` hanya bisa dikurang jika nilainya lebih dari 0. Artinya `_counter` tidak bisa bernilai negatif.

   Fungsionalitas ini digunakan pada bagian berikut:

   ```dart
    Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Row(
        mainAxisAlignment: _counter > 0
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
            if (_counter > 0)
            FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
            ),
        ],
        ),
    ),
   ```

   Untuk mengerjakan bagian bonus, saya menambah kondisi kapan tombol _decrement_ boleh ditampilkan, yaitu hanya ketika `_counter` lebih dari 0.
