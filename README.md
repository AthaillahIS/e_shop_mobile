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
