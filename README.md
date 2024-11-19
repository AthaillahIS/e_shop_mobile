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


# Tugas 9: Pengelolaan Autentikasi dan Pengiriman Data JSON dengan Django


## Mengapa Kita Perlu Membuat Model untuk Pengambilan atau Pengiriman Data JSON?

Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena model ini akan berfungsi sebagai representasi dari struktur data yang akan dikirim atau diterima dalam format JSON. Berikut alasan mengapa model dibutuhkan:

- **Menghindari Kesalahan Pemetaan Data**: Dengan model, kita dapat memastikan bahwa data yang diterima atau dikirim sesuai dengan struktur yang diinginkan. Tanpa model, akan ada potensi kesalahan saat parsing data, terutama ketika data JSON tidak sesuai dengan yang diharapkan.
- **Pemeliharaan Kode yang Lebih Mudah**: Model yang jelas akan memudahkan pemahaman dan modifikasi kode di masa depan, terutama saat ada perubahan pada struktur data.
- **Pencegahan Kesalahan Tipe Data**: Dengan model, kita dapat memastikan bahwa tipe data yang diterima atau dikirim sesuai dengan yang diinginkan, menghindari kemungkinan kesalahan dalam pemrosesan data.

## Fungsi dari Library `http`

Library `http` di Flutter digunakan untuk melakukan request HTTP ke server. Fungsi utama dari library ini adalah:

- **GET**: Mengambil data dari server.
- **POST**: Mengirimkan data ke server.
- **PUT**: Memperbarui data yang ada di server.
- **DELETE**: Menghapus data dari server.
- **Handling Response**: Memproses respons yang diterima dari server (biasanya dalam bentuk JSON) untuk digunakan dalam aplikasi.

## Fungsi dari `CookieRequest` dan Mengapa Instance `CookieRequest` Perlu Dibagikan ke Semua Komponen di Aplikasi Flutter

`CookieRequest` adalah kelas yang mengelola pengiriman dan penerimaan cookies dalam aplikasi. Cookies adalah data yang disimpan oleh aplikasi untuk mengidentifikasi pengguna dan menyimpan status autentikasi mereka. Biasanya, cookies digunakan untuk menyimpan session ID atau token otentikasi yang digunakan untuk memverifikasi identitas pengguna saat melakukan permintaan lebih lanjut ke server.

**Mengapa instance `CookieRequest` perlu dibagikan?**

- Untuk memastikan bahwa sesi pengguna tetap konsisten di seluruh aplikasi, cookie yang berisi token atau informasi sesi harus dapat diakses di semua komponen yang membutuhkan akses tersebut. Jika `CookieRequest` hanya ada di satu tempat, maka aplikasi akan kesulitan dalam menjaga status autentikasi di seluruh halaman.
- Dengan membagikan instance `CookieRequest`, kita memastikan bahwa cookies dapat diteruskan bersama permintaan HTTP, sehingga pengguna tidak perlu melakukan login berulang kali saat berpindah antara tampilan di aplikasi.

## Mekanisme Pengiriman Data Mulai dari Input hingga Dapat Ditampilkan pada Flutter

Proses pengiriman data dimulai dengan input yang dilakukan oleh pengguna di aplikasi Flutter. Berikut adalah langkah-langkahnya:

1. **Input Data**: Pengguna memasukkan data melalui form atau antarmuka aplikasi di Flutter.
2. **Pengiriman Data**: Setelah data dimasukkan, aplikasi Flutter mengirimkan data tersebut ke server menggunakan HTTP request, seperti POST, melalui library http. Data ini biasanya dikirim dalam format JSON.
3. **Pemrosesan di Server**: Server (misalnya Django) menerima data tersebut, memprosesnya, dan melakukan operasi yang diperlukan, seperti menyimpan data ke database atau menjalankan logika bisnis.
4. **Respons dari Server**: Setelah proses selesai, server mengirimkan respons (misalnya status sukses atau data yang diubah) kembali ke aplikasi Flutter.
5. **Menampilkan Data di Flutter**: Aplikasi Flutter menerima respons dari server dan mengupdate antarmuka pengguna (UI) dengan data terbaru.

## Mekanisme Autentikasi dari Login, Register, Hingga Logout

Berikut adalah mekanisme autentikasi secara umum dari login, register, hingga logout:

### Register:
1. Pengguna mengisi form registrasi di aplikasi Flutter dengan data seperti nama, email, dan password.
2. Data ini dikirimkan melalui HTTP POST request ke server (misalnya Django).
3. Server memproses data, menyimpan informasi pengguna baru dalam database, dan mungkin mengirimkan token atau session ID sebagai respons.
4. Aplikasi Flutter menerima respons dari server, menyimpan token autentikasi (misalnya dalam cookies atau storage lokal), dan mengalihkan pengguna ke halaman utama.

### Login:
1. Pengguna mengisi form login dengan email dan password.
2. Data login dikirimkan ke server melalui HTTP POST request.
3. Server memverifikasi kredensial pengguna, dan jika valid, server mengirimkan token autentikasi atau session ID sebagai respons.
4. Aplikasi Flutter menyimpan token ini (biasanya dalam cookies atau local storage) untuk sesi yang aktif dan mengarahkan pengguna ke halaman utama.

### Logout:
1. Pengguna mengklik tombol logout di aplikasi Flutter.
2. Aplikasi mengirimkan request ke server untuk mengakhiri sesi pengguna (misalnya dengan menghapus session atau token).
3. Setelah logout berhasil, aplikasi menghapus token autentikasi dari penyimpanan lokal dan mengarahkan pengguna kembali ke halaman login.

### Proses Autentikasi di Django:
- Server Django menerima request login atau register, memverifikasi kredensial atau data yang diterima.
- Jika login berhasil, Django akan membuat sesi atau memberikan token otentikasi (misalnya JWT) dan mengirimkan respons yang sesuai ke aplikasi Flutter.
- Server juga mengelola sesi dan autentikasi selama interaksi pengguna, termasuk logout yang menghapus token atau sesi yang ada.

Dengan cara ini, aplikasi Flutter dapat melakukan proses autentikasi secara aman dan menjaga sesi pengguna tetap valid selama aplikasi digunakan.

## Implementasi Checklist
### Membuat Halaman Registrasi di Flutter
- Buat halaman registrasi dengan form yang mencakup input untuk username, password, dan konfirmasi password.
- Implementasi validasi dasar pada form untuk memastikan bahwa semua kolom diisi dan password yang dimasukkan sesuai dengan konfirmasi password.
- Setelah pengguna mengklik tombol "Daftar", kirim request HTTP POST ke endpoint /auth/register/ di backend Django. Data dikirim dalam format JSON menggunakan objek CookieRequest yang berisi username, password1, dan password2.
- Di sisi backend Django, fungsi register() akan memvalidasi data. Jika password yang dimasukkan cocok dan username belum ada di database, Django akan membuat akun baru menggunakan metode User.objects.create_user().
- Jika registrasi berhasil, Django akan mengirimkan respons sukses (status 200) ke aplikasi Flutter.
- Flutter akan menampilkan notifikasi sukses menggunakan SnackBar dan kemudian mengarahkan pengguna ke halaman login dengan Navigator.pushReplacement().
### Membuat Halaman Login di Flutter
- Halaman login di Flutter dibuat dengan dua input, yaitu username dan password, serta tombol "Login".
- Ketika pengguna mengklik tombol "Login", kirim request POST ke endpoint /auth/login/ di Django dengan menggunakan objek CookieRequest. Data yang dikirim berupa JSON yang berisi username dan password.
- Django akan menggunakan fungsi authenticate() untuk memverifikasi kredensial. Jika valid, Django akan membuat sesi pengguna dengan auth_login() dan mengirimkan cookie sesi kembali ke aplikasi Flutter.
- Flutter menyimpan cookie sesi yang diterima dan menampilkan pesan sukses dengan SnackBar. Setelah itu, aplikasi akan mengarahkan pengguna ke halaman utama (misalnya, MyHomePage). Jika login gagal, akan ditampilkan pesan error menggunakan AlertDialog.
### Mengintegrasikan Sistem Autentikasi Django dengan Flutter
- Di Flutter, gunakan library pbp_django_auth yang mendukung autentikasi berbasis cookie. Dengan ini, Flutter dapat menyimpan dan mengelola cookie sesi pengguna yang diterima dari Django.
- Gunakan Provider untuk membagikan instance CookieRequest secara global, memungkinkan seluruh aplikasi Flutter untuk mengakses sesi pengguna tanpa perlu membuat instance baru setiap kali.
- Setiap kali aplikasi Flutter mengirimkan request, cookie sesi pengguna otomatis disertakan, sehingga backend Django dapat memverifikasi sesi login pengguna.
### Membuat Model Kustom di Django dan Menggunakan QuickType di Flutter
- Di Django, buat model sesuai kebutuhan aplikasi, misalnya model produk atau item yang akan ditampilkan di Flutter.
- Ambil contoh respons JSON dari endpoint Django yang mengembalikan daftar produk.
- Gunakan QuickType untuk mengonversi respons JSON tersebut menjadi model Dart yang dapat langsung digunakan dalam aplikasi Flutter.
- Model Dart yang sudah jadi dapat dimanfaatkan untuk mengolah data JSON yang diterima dari API dan menampilkannya di UI Flutter.
### Membuat Halaman Daftar Produk di Flutter
- Di Flutter, buat halaman yang menampilkan daftar produk dengan mengambil data dari API Django melalui endpoint yang telah disiapkan.
- Implementasikan fungsi fetchItem() yang menggunakan objek CookieRequest untuk melakukan request GET ke URL API Django (misalnya, http://10.0.2.2:8000/json/).
- Setelah data produk diterima dalam format JSON, konversi data tersebut menjadi objek Product menggunakan metode fromJson().
- Tampilkan data produk menggunakan widget ListView.builder. Jika data belum diterima, tampilkan CircularProgressIndicator sebagai indikasi bahwa data sedang dimuat.
- Jika data sudah tersedia, buat daftar produk menggunakan ListView.builder, di mana setiap item produk akan ditampilkan menggunakan widget Container.
### Membuat Halaman Detail Produk
- Ketika pengguna menekan salah satu produk di halaman daftar, Navigator.push() akan menavigasi ke halaman detail produk, mengirimkan data produk yang dipilih sebagai argumen.
- Pada halaman detail, ditampilkan semua atribut produk, seperti nama, harga, deskripsi, dan rating, menggunakan widget Text dan Padding untuk penataan yang rapi.
- Implementasi tombol kembali menggunakan Navigator.push untuk memungkinkan pengguna kembali ke halaman daftar produk.
### Melakukan Filter Produk Berdasarkan Pengguna yang Login
- Modifikasi endpoint Django untuk hanya mengembalikan produk yang terkait dengan pengguna yang sedang login. Untuk memastikan hanya data milik pengguna tersebut yang dikembalikan digunakan query filter berdasarkan request.user.
- Saat mengambil data produk dari API di Flutter, hanya produk yang relevan untuk pengguna yang sedang login yang diterima dan ditampilkan.