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

# Tugas 8

### `Navigator.push` vs `Navigator.pushReplacement`

Pada dasarnya, `Navigator.push` akan menampilkan _screen_ baru ke layar dengan menumpukkan _screen_ baru tersebut ke _stack_ seluruh _screen_ yang ada. Sementara itu, `Navigator.pushReplacement` akan menampilkan _screen_ baru, kemudian menghilangkan _screen_ sebelumnya dari _stack_.

### Widget yang Digunakan pada Tugas Ini

- `SingleChildScrollView()`
  Widget ini berfungsi untuk menampilkan bagian yang bisa di-_scroll_, tetapi hanya memuat satu _child_.

- `TextFormField()`
  Widget ini berfungsi untuk menerima input teks dari user. Widget ini juga bisa dimanfaatkan untuk menerima input angka dengan melakukan _parsing_ dan pemberian batasan pada input yang bisa diberikan _user_ terlebih lanjut.

- `InputDecoration()`
  Widget ini berfungsi untuk menghias input.

- `OutlineInputBorder()`
  Widget ini berfungsi untuk menghias input, khususnya pada bagian border input.

- `SizedBox()`
  Widget ini saya manfaatkan untuk memberikan margin di antara elemen-elemen.

- `DropDownButton()`
  Widget ini berfungsi untuk menampilkan opsi yang bisa dipilih _user_.

- `DropDownMenuItem()`
  Widget ini berfungsi untuk menampung nilai opsi yang bisa dipilih oleh _user_. Kemudian data ini bisa disimpan.

- `TextButton()`
  Widget ini berfungsi untuk membuat tombol submisi form.

- `ButtonStyle()`
  Widget ini berfungsi untuk menghias tombol.

- `ListView()`
  Widget ini saya manfaatkan untuk menampung `ListTile()` yang akan menampilkan data dalam bentuk list _card_ (mirip widget chat di LINE atau WhatsApp).

- `ListTile()`
  Widget ini berfungsi utnuk menampung data-data `BudgetItem` yang ingin saya tampilkan.

- `CustomDrawer()`
  Widget _custom_ ini saya gunakan (selain untuk mengerjakan bonus :)) untuk membersihkan kode aplikasi ini, karena saya menggunakan _drawer_ di semua _screen_.

### Jenis Event pada Flutter

- `onChanged`
  Akan di-_trigger_ ketika suatu nilai berubah (umum digunakan untuk `setState()` pada form).

- `onPressed`
  Akan di-_trigger_ ketika suatu widget dipencet.

- `onTap`
  Akan di-_trigger_ ketika suatu widget dipencet. Mirip dengan `onPressed`.

- `onSaved`
  Akan di-_trigger_ ketika form telah di-_submit_.

### Cara Kerja `Navigator`

_Referensi: https://api.flutter.dev/flutter/widgets/Navigator-class.html_
`Navigator` mengelola _screen_ atau _page_ yang ada di aplikasi Flutter dengan menggunakan konsep _stack_. Jika seorang _user_ memencet tombol yang akan membawa _user_ tersebut ke _screen_ lain, maka (secara umum ) _screen stack_ aplikasi akan bertambah, dan jika _user_ tersebut keluar dari _screen_ tersebut, maka _stack_ akan diperbaharui dengan melakukan _pop_ pada _stack_.

### Implementasi Checklist

- `budget_item.dart`
  Untuk mempermudah operasi penambahan `budget_item` pada aplikasi ini, saya membuat class `BudgetItem()` yang terdiri dari atribut `judul`, `nominal`, dan `jenis`.

- `form.dart`
  Saya menggunakan `TextFormField()` untuk membuat input judul dan nominal, `DropDownButton()` dan `DropDownItem()` untuk membuat input jenis, dan `TextButton()` untuk submisi data. Saya juga melakukan sedikit _styling_ pada form ini. Kemudian, saya juga meng-_handle_ agar _state_ dari input _user_ tertangkap dengan baik, yaitu dengan menggunakan `setState()` pada bagian yang sesuai.

- `budget_items_provider.dart`
  Untuk mempemudah _state management_ pada aplikasi ini, saya membuat _provider_ untuk menampung data yang sudah ditambahkan _user_.

  ```dart
  class BudgetItemsProvider extends ChangeNotifier {
    List<BudgetItem> budgetItems;

    BudgetItemsProvider({
      required this.budgetItems,
    });

    void addBudgetItems(BudgetItem newItem) {
      budgetItems.add(newItem);
    }
  }
  ```

  Ketika saya mau mengakses `budgetItems` atau menambah `BudgetItem` baru, saya bisa memanfaatkan _provider_ ini. Untuk mempermudah pengelolaan, saya memberikan _provider_ ini kepada `MaterialApp()`.

  ```dart
  class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => BudgetItemsProvider(budgetItems: []))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Program Counter'),
        ),
      );
    }
    ...
  }
  ```

- `data.dart`
  _Provider_ dari `budget_items_provider.dart` saya manfaatkan pada bagian ini. Untuk mengakses seluruh _item_ yang telah diinput oleh _user_, maka saya menggunakan kode berikut:

  ```dart
  // ListTile ini adalah bagian dari drawer

  // Ketika mengakses _screen_ Data Budget, data budgetItems akan diberikan kepada _screen_ tersebut dengan memanfaatkan provider yang telah dibuat sebelumnya
  ...
  ListTile(
    title: const Text('Data Budget'),
    onTap: () {
      // Route menu ke halaman Data Budget
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DataPage(
                budgetItems: Provider.of<BudgetItemsProvider>(context)
                    .budgetItems)),
      );
    },
  ),
  ...
  ```

  Kemudian data tersebut ditampilkan dengan kode berikut:

  ```dart
  // ini adalah atribut body Scaffold dalam file data.dart
  body: ListView.builder(
        itemCount: budgetItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(budgetItems[index].judul),
            subtitle: Text('${budgetItems[index].nominal}'),
            trailing: Text(budgetItems[index].jenis),
          );
        },
      ),
  ```
