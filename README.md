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

# Tugas 9

### Mekanisme Pengambilan JSON dengan Model vs Tanpa Model

Bagian ini mengambil referensi dari [link berikut](https://docs.flutter.dev/development/data-and-backend/json).

Pada dasarnya, kita bisa mengambil data JSON tanpa membuat model terlebih dahulu, seperti yang disampaikan. Tetapi, hal ini dinilai kurang _sustainable_ karena kita tidak dapat mengetahui tipe data dari masing-masing _field_ data JSON tersebut, sehingga _intellisense_ IDE juga tidak dapat dimanfaatkan. Intinya adalah kemungkinan kode kita mengalami _error_ lebih besar.

### Widget yang Digunakan pada Tugas 9

- `CustomDrawer()`
  Widget ini digunakan untuk membawa elemen navigasi pada `mywatchlist.dart` dan `mywatchlist_by_id.dart`.

- `FutureBuilder()`
  Widget ini berfungsi untuk menampilkan widget berdasarkan suatu _snapshot_ data tertentu.

- `ListView.builder()`
  Widget ini berfungsi untuk menampilkan seluruh _watchlist_ dengan format _scrollable_ secara vertikal.

- `GestureDetector()`
  Widget ini membuat widget `Container()` yang akan menampung _card_ _watchlist item_ menjadi _pressable_ dan dapat men-_trigger_ suatu fungsi `onTap`.

- `Container()`
  Widget ini berguna untuk menampung _card_ _watchlist item_.

- `BoxDecoration()`
  Widget ini berguna untuk menghias widget `Container()`.

- `Row()`
  Widget ini berfungsi untuk menata elemen di dalam _card_ secara horizontal.

- `Flexible()`
  Widget ini berguna untuk mengatasi kasus di mana judul filmnya terlalu panjang, sehingga nanti di akhir _string_ judul akan diberikan "...".

- `Checkbox()`
  Widget ini berfungsi untuk menandakan sudah atau belumnya suatu film ditonton, dan bisa juga mengubah _status_ tersebut.

- `Text()`
  Widget ini digunakan untuk menampilkan teks di layar.

- `Column()`
  Widget ini berfungsi untuk menyajikan elemen secara vertikal. Widget ini digunakan pada `mywatchlist_by_id.dart`.

- `Padding()`
  Widget ini berfungsi untuk menyediakan _padding_ bagi _child widget_-nya.

- `Text.rich()`
  Widget ini berfungsi untuk menampilkan teks dengan format yang berbeda untuk setiap bagian teksnya.

  ```
  Misalkan,

  Release Date: Oct. 20, 2022

  "Release Date: " bisa di-bold, sementara tanggalnya tidak.
  ```

- `Expanded()`
  Widget ini berfungsi agar _child widget_-nya dapat mengambil seluruh _space_ yang tersedia.

### Mekanisme Pengambilan Data JSON

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/models/watchlist_item.dart';

Future<List<WatchListItem>> fetchWatchList() async {
  var url = Uri.parse("http://gibs-tugas-pbp.herokuapp.com/mywatchlist/json/");

  var res = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(res.bodyBytes));

  List<WatchListItem> watchList = [];
  for (var d in data) {
    if (d != null) watchList.add(WatchListItem.fromJson(d));
  }

  return watchList;
}
```

Keterangan:

1. Mengakses _endpoint_ [berikut](http://gibs-tugas-pbp.herokuapp.com/mywatchlist/json/) dengan _request_ GET.

2. Menunggu _response_ dari server.

3. Mem-_parse_ data dari server menggunakan fungsi yang ada pada `models/watchlist_item.dart`.

4. Menyajikan data di aplikasi.

### Implementasi _Checklist_

1. Tombol Navigasi ke `mywatchlist.dart`
   Untuk itu, saya menambahkan _route_ menuju halaman ini pada `CustomDrawer()` yang telah saya buat di tugas sebelumnya. Saya membuat _halaman_ `mywatchlist.dart` terlebih dahulu, kemudian mengatur _route_-nya sebagai berikut:

   ```dart
   class CustomDrawer extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            ...
            // Route ke halaman mywatchlist.dart
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman Data Budget
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  Future<List<WatchListItem>> watchList = fetchWatchList();
                  return MyWatchList(
                      title: "My Watch List", watchList: watchList);
                }));
              },
            ),
          ],
        ),
      ),
    );
   }
   }
   ```

   2. Model _mywatchlist_
      Untuk itu, saya menyalin data JSON dari _endpoint_ JSON [berikut]("http://gibs-tugas-pbp.herokuapp.com/mywatchlist/json/") ke situs Quicktype, kemudian mengikuti langkah seperti pada Lab 8 untuk mendapatkan model yang sesuai dengan data JSON tersebut. Saya kemudian menyalin hasilnya ke `models/watchlist_item.dart`.

   3. Membuat halaman _mywatchlist_
      Untuk itu, setelah menambahkan _dependency_ HTTP yang diperlukan, saya harus mengambil data JSON-nya terlebih dahulu, dengan fungsi berikut:

      ```dart
      import 'dart:convert';
      import 'package:http/http.dart' as http;
      import 'package:counter_7/models/watchlist_item.dart';

      Future<List<WatchListItem>> fetchWatchList() async {
        var url = Uri.parse("http://gibs-tugas-pbp.herokuapp.com/mywatchlist/json/");

        var res = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "\*",
          "Content-Type": "application/json",
          },
        );

        var data = jsonDecode(utf8.decode(res.bodyBytes));

        List<WatchListItem> watchList = [];
        for (var d in data) {
          if (d != null) watchList.add(WatchListItem.fromJson(d));
        }

        return watchList;
      }

      ```

      Kemudian ketika user mengakses halaman _mywatchlist_, fungsi tersebut akan dipanggil dan dijadikan argumen _page_.

      ```dart
       ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman Data Budget
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  Future<List<WatchListItem>> watchList = fetchWatchList();
                  return MyWatchList(
                      title: "My Watch List", watchList: watchList);
                }));
              },
            ),
      ```

      Saya kemudian mengolah data ini dengan `FutureBuilder()`:

      ```dart
      ...
      body: FutureBuilder(
            future: widget.watchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [Text("Tidak ada watchlist yang ada.")],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            // Handler navigasi ke halaman detail film

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyWatchListById(
                                    title: 'Detail',
                                    watchListItem: snapshot.data![index],
                                  ),
                                ));
                          },
                          // Card Film

                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 1.5,
                                      color:
                                          snapshot.data![index].fields.watched
                                              ? Colors.green
                                              : Colors.red)),
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Judul Film

                                  Flexible(
                                    child: Text(
                                      snapshot.data![index].fields.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor: Colors.green,
                                    value: snapshot.data![index].fields.watched,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields.watched =
                                            !snapshot
                                                .data![index].fields.watched;
                                      });
                                    },
                                  ),
                                ],
                              )),
                        );
                      });
                }
              }
            })
      ...
      ```

   4. Membuat halaman untuk masing-masing _watchlist item_
      Ketika user memencet _card_ judul film, maka user akan pergi ke halaman berikut:

   ```dart
   ...
   Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            // Detail Film

            Expanded(
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      widget.watchListItem.fields.title,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Release Date
                        Text.rich(
                          TextSpan(
                            // with no TextStyle it will have default text style
                            children: <TextSpan>[
                              // Release Date
                              const TextSpan(
                                  text: 'Release Date: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: DateFormat.yMMMMd('en_US').format(
                                      widget.watchListItem.fields.releaseDate)),
                            ],
                          ),
                        ),

                        // Rating
                        Text.rich(
                          TextSpan(
                            // with no TextStyle it will have default text style
                            children: <TextSpan>[
                              // Release Date
                              const TextSpan(
                                  text: 'Rating: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      '${widget.watchListItem.fields.rating.toDouble()}/5'),
                            ],
                          ),
                        ),

                        // Status
                        Text.rich(
                          TextSpan(
                            // with no TextStyle it will have default text style
                            children: <TextSpan>[
                              // Release Date
                              const TextSpan(
                                  text: 'Status: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: widget.watchListItem.fields.watched
                                      ? 'watched'
                                      : 'not watched'),
                            ],
                          ),
                        ),

                        // Status
                        const Text('Review:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.watchListItem.fields.review),
                      ]),
                ],
              ),
            ),

            // Tombol Back

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("Back", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ]),
        ));
    ...
   ```

   Pada halaman tersebut, terdapat detail setiap film dan tombol untuk kembali ke halaman berikutnya.
