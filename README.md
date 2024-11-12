## Identitas Mahasiswa
- **Nama**: Athaillah Sifa Tanudatar
- **NPM**: 2306275683
- **Kelas**: PBP E

# Tugas 7 : Elemen dasar flutter

## A. Perbedaan Stateless Widget dan Stateful Widget
- **Stateless Widget**: Widget yang tidak memiliki data atau status yang berubah selama aplikasi berjalan. Artinya, widget bersifat statis dan tidak akan berubah setelah pertama kali dirender. Contoh Stateless Widget dalam tugas ini adalah `MyHomePage`, `ItemCard`, dan `InfoCard`, karena mereka tidak perlu menyimpan atau mengubah status internal.
  
- **Stateful Widget**: Widget yang memiliki status yang dapat berubah selama aplikasi berjalan. Jika ada perubahan data yang memerlukan pembaruan tampilan, widget ini dapat di-update menggunakan metode `setState()`. Misalnya, fitur yang menambah jumlah produk dalam keranjang belanja secara dinamis akan membutuhkan Stateful Widget.

## B. Widget yang Digunakan dalam Tugas

Dalam tugas ini, terdapat dua jenis widget yang digunakan:

1. **Widget Custom**: Widget yang dibuat secara khusus untuk aplikasi ini dan mengimplementasikan widget bawaan Flutter. Contoh widget custom adalah `MyHomePage`, `ItemCard`, dan `InfoCard`.

2. **Widget Bawaan Flutter**: Widget yang sudah disediakan oleh Flutter untuk mempermudah pengembangan aplikasi. Beberapa contoh widget bawaan yang digunakan di aplikasi ini adalah:
   - `MaterialApp`, `Material`, `InkWell`, `ScaffoldMessenger`, `SnackBar`, `Text`, `Container`, `Center`, `Column`, `Icon`, `Padding`, `Scaffold`, `AppBar`, `Row`, `SizedBox`, dan `GridView`.

## C. Fungsi setState()
`setState()` adalah fungsi yang hanya dapat digunakan di dalam Stateful Widget. Ketika `setState()` dipanggil, Flutter akan menandai widget yang dipengaruhi oleh perubahan sebagai perlu di-update, lalu akan merender ulang widget tersebut dengan data terbaru. Fungsi ini memungkinkan pembaruan tampilan secara dinamis sesuai dengan perubahan data.

## D. Perbedaan const dan final

- **`const`**: Digunakan untuk nilai yang benar-benar konstan dan sudah bisa ditentukan saat waktu kompilasi (compile-time). `const` tidak akan berubah selama aplikasi berjalan. Dalam Flutter, `const` sering digunakan pada widget statis yang tidak perlu diubah. Contoh: `const Text("Welcome to E-Shop Mobile")`.
  
- **`final`**: Digunakan untuk nilai yang hanya dapat diinisialisasi sekali, tetapi inisialisasi itu dapat dilakukan saat runtime (tidak harus saat compile-time seperti `const`). `final` lebih fleksibel dibandingkan `const`. Contoh: `final String npm = '2306275683';`.

## E. Cara Implementasi Checklist

1. **Membuat Flutter Project** bernama `eshop`.
2. **Memindahkan `MyHomePage` ke `menu.dart`**: Memisahkan file untuk `MyHomePage` ke `menu.dart` untuk kebersihan dan pemeliharaan kode.
3. **Membuat `ItemHomepage` sebagai Field dari `ItemCard`**: `ItemHomepage` menyimpan informasi setiap item seperti nama, ikon, dan warna, yang memungkinkan `ItemCard` menampilkan informasi item yang sesuai dalam grid.
4. **Membuat `ItemCard` sebagai Tombol untuk Memunculkan Snackbar**: `ItemCard` menggunakan `InkWell` untuk membuatnya interaktif, dan menampilkan `Snackbar` saat ditekan.
5. **Membuat `InfoCard` untuk Identitas Mahasiswa**: `InfoCard` menampilkan informasi seperti NPM, Nama, dan Kelas, yang diambil dari field pada `MyHomePage`.
6. **Mengubah `MyHomePage` Menjadi Stateless Widget**: Mengonversi `MyHomePage` menjadi Stateless Widget karena tidak membutuhkan status yang berubah.


# Tugas 8 : Flutter Navigation, Layouts, Forms, and Input Elements

## A. Kegunaan const dalam Flutter
- Ketika sebuah widget ditandai dengan keyword const dalam Flutter, Flutter akan mengenalinya sebagai pre-build object yang sudah dibangun sebelumnya dan bersifat tidak dapat diubah (immutable). Hal ini memungkinkan Flutter untuk menggunakan kembali objek yang sudah ada daripada membuat objek baru. Reuse widget menghindari perhitungan dan alokasi objek yang tidak perlu, sehingga meningkatkan kinerja aplikasi.

## B. Column dan Row
- Column dan Row adalah widget layout di Flutter yang digunakan untuk menyusun beberapa widget dalam satu arah. Column mengatur widget secara vertikal, sementara Row mengatur secara horizontal. Contoh penggunaan row terdapat dalam menu.dart, dimana Row menyusun 3 child widget InfoCard secara horizontal. Sedangkan penggunaan row terdapat dalam itementry_form, dimana Column menyusun children Pading yang digunakan untuk melayout fields.

## C. Input Element
- Pada halaman form app ini, elemen input yang digunakan termasuk Form dan TextFormField untuk input teks. Beberapa elemen input lain di Flutter yang tidak digunakan dalam tugas ini adalah DropdownButtonFormField, SearchField, Radio, Checkbox, Slider, Switch, dll.

## D. Mengatur konsistensi Theme
- Dalam kode ini, primary dan secondary color didefinisikan dalam MaterialApp main.dart digunakan untuk mengatur konsistensi warna background atau theme. Untuk mengakses warna dari theme, gunakan Theme.of(context)..<warna yang diinginkan>.

## E. Navigasi Halaman
- Dalam kode ini, navigasi halaman dilakukan dengan mengimplementasikan path managing system, yaitu Navigator. Terdapat 3 elemen navigasi yaitu, Navigator.push digunakan untuk menambahkan halaman baru ke tumpukan navigasi dan berpindah ke halaman tersebut, Navigator.pushReplacement digunakan untuk menggantikan halaman saat ini dengan halaman baru tanpa menambahkannya ke Stack, dan Navigator.pop digunakan untuk kembali ke halaman sebelumnya dengan menghapus halaman saat ini dari tumpukan.

## F. Implementasi checklist
- Buat file screen atau halaman item_form.dart yang berisi form input dengan field seperti nama, stok, harga, deskripsi, dan rating, serta tombol untuk menyimpan data. Pada setiap field, lakukan validasi, dan jika semua validasi lolos, tampilkan data yang dimasukkan dalam sebuah AlertDialog.

- Buat folder screens untuk menyimpan file item_form.dart dan menu.dart.

- Tambahkan drawer di file left_drawer.dart, yang memungkinkan navigasi ke halaman main.dart dan item_form.dart. Pastikan drawer ini dapat diakses dari kedua halaman tersebut.

- Lakukan refaktor pada main.dart dengan memindahkan ItemCard dan ItemHomePage ke dalam file item_card.dart.

- Buat folder widgets untuk menyimpan file left_drawer.dart dan item_card.dart.


# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

## A. Kegunaan `const` dalam Flutter
Ketika sebuah widget ditandai dengan keyword `const` dalam Flutter, Flutter akan mengenalinya sebagai objek yang sudah dibangun sebelumnya dan bersifat tidak dapat diubah (immutable). Hal ini memungkinkan Flutter untuk menggunakan kembali objek yang sudah ada daripada membuat objek baru. Penggunaan kembali widget menghindari perhitungan dan alokasi objek yang tidak perlu, sehingga meningkatkan kinerja aplikasi.

## B. Column dan Row
`Column` dan `Row` adalah widget layout di Flutter yang digunakan untuk menyusun beberapa widget dalam satu arah. `Column` mengatur widget secara vertikal, sementara `Row` mengatur secara horizontal. Contoh penggunaan `Row` terdapat dalam `menu.dart` line 43, dimana `Row` menyusun 3 child widget `InfoCard` secara horizontal. Sedangkan penggunaan `Column` terdapat dalam `itementry_form` line 32, dimana `Column` menyusun children `Padding` yang digunakan untuk melayout fields.

## C. Input Element
Pada halaman form aplikasi ini, elemen input yang digunakan termasuk `Form` dan `TextFormField` untuk input teks. Beberapa elemen input lain di Flutter yang tidak digunakan dalam tugas ini adalah `DropdownButtonFormField`, `SearchField`, `Radio`, `Checkbox`, `Slider`, `Switch`, dll.

## D. Mengatur Konsistensi Theme
Dalam kode ini, `primary` dan `secondary` color didefinisikan dalam `MaterialApp` di `main.dart` untuk mengatur konsistensi warna background atau theme. Untuk mengakses warna dari theme, gunakan `Theme.of(context).<warna yang diinginkan>`.

## E. Navigasi Halaman
Dalam kode ini, navigasi halaman dilakukan dengan mengimplementasikan path managing system, yaitu `Navigator`. Terdapat 3 elemen navigasi, yaitu:
- `Navigator.push`: Menambahkan halaman baru ke tumpukan navigasi dan berpindah ke halaman tersebut.
- `Navigator.pushReplacement`: Menggantikan halaman saat ini dengan halaman baru tanpa menambahkannya ke Stack.
- `Navigator.pop`: Kembali ke halaman sebelumnya dengan menghapus halaman saat ini dari Stack.

## F. Implementasi Checklist
1. Buat file screen atau halaman `item_form.dart` yang berisi form input dengan field seperti `nama`, `stok`, `harga`, `deskripsi`, dan `rating`, serta tombol untuk menyimpan data. Pada setiap field, lakukan validasi, dan jika semua validasi lolos, tampilkan data yang dimasukkan dalam sebuah `AlertDialog`.
2. Buat folder `screens` untuk menyimpan file `item_form.dart` dan `menu.dart`.
3. Tambahkan drawer di file `left_drawer.dart`, yang memungkinkan navigasi ke halaman `main.dart` dan `item_form.dart`. Pastikan drawer ini dapat diakses dari kedua halaman tersebut.
4. Lakukan refaktor pada `main.dart` dengan memindahkan `ItemCard` dan `ItemHomePage` ke dalam file `item_card.dart`.
5. Buat folder `widgets` untuk menyimpan file `left_drawer.dart` dan `item_card.dart`.
