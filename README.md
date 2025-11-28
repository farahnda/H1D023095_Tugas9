Nama: Farah Tsani Maulida

NIM: H1D023095

Shift D -> Shift F

# Proses Registrasi  
## a. 
<img src="https://github.com/user-attachments/assets/f9829dd0-998c-4bec-93de-09a7fc5d0890" width="300">
<img src="https://github.com/user-attachments/assets/5dde284d-aa06-45bc-a7b2-89c60dc7098d" width="300">  

### Penjelasan
Proses registrasi di aplikasi ini dilakukan melalui halaman RegistrasiPage, di mana pengguna mengisi data seperti email, password, dan informasi lain yang diperlukan. Setelah formulir diisi dan divalidasi, data dikirim ke backend melalui API yang menangani pembuatan akun baru. Jika registrasi berhasil, sistem biasanya menyimpan token atau ID pengguna untuk sesi berikutnya dan memberi notifikasi sukses kepada pengguna. Sebaliknya, jika terjadi kesalahan, aplikasi menampilkan dialog peringatan agar pengguna mencoba lagi. Intinya, registrasi memastikan pengguna terdaftar di sistem sebelum bisa melakukan login dan mengakses halaman utama aplikasi seperti ProdukPage.
## b.
<img src="https://github.com/user-attachments/assets/839d1824-17a6-4d12-aa2f-64fa240b3620" width="300">


### Penjelasan
```
// Jika registrasi berhasil
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => SuccessDialog(
    description: "Registrasi berhasil, silahkan login",
    okClick: () {
      Navigator.pop(context); // tutup popup
    },
  ),
);

// Jika registrasi gagal
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => const WarningDialog(
    description: "Registrasi gagal, silahkan coba lagi",
  ),
);
```
1. Jika registrasi berhasil
   - Data nama, email, dan password dikirim ke backend melalui RegistrasiBloc.registrasi.
   - Jika proses berhasil, ditampilkan popup sukses (SuccessDialog) dengan pesan “Registrasi berhasil, silahkan login”.
   - Setelah menekan tombol OK, popup ditutup. Pengguna bisa kembali ke halaman login untuk masuk.
2. Jika registrasi gagal (misal email sudah terdaftar atau error lain)
   - Ditampilkan popup peringatan (WarningDialog) dengan pesan “Registrasi gagal, silahkan coba lagi”.
   - Popup ini hanya memberi informasi dan tetap berada di halaman registrasi.

# Proses Login  
## a. 
<img src="https://github.com/user-attachments/assets/9dcc261f-b524-4bf5-a0c2-61674c4f22a8" width="300">
<img src="https://github.com/user-attachments/assets/fcd90821-2463-4e1a-a921-376ec2da2012" width="300">  

### Penjelasan
Proses login di halaman LoginPage dimulai ketika pengguna mengisi email dan password, lalu menekan tombol Login. Formulir akan divalidasi terlebih dahulu untuk memastikan email dan password tidak kosong. Jika valid, data dikirim ke backend melalui LoginBloc.login. Jika backend merespon dengan kode 200, token dan ID pengguna disimpan menggunakan UserInfo(), lalu muncul popup sukses (SuccessDialog) yang memberi tahu pengguna bahwa login berhasil, dan setelah menekan OK, pengguna diarahkan ke halaman ProdukPage. Jika login gagal atau terjadi error, muncul popup peringatan (WarningDialog) yang memberitahu pengguna untuk mencoba lagi tanpa berpindah halaman.
## b.
<img src="https://github.com/user-attachments/assets/542e079b-0015-4788-93bb-8e909e3448f3" width="300">


### Penjelasan
```
// Jika login berhasil
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => SuccessDialog(
    description: "Login berhasil, selamat datang!",
    okClick: () {
      Navigator.pop(context); // tutup popup
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ProdukPage()),
        (route) => false,
      );
    },
  ),
);
// Jika login gagal
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => const WarningDialog(
    description: "Login gagal, silahkan coba lagi",
  ),
);
```
1. Jika login berhasil (value.code == 200)
   - Token dan ID pengguna disimpan di local storage menggunakan UserInfo().
   - Ditampilkan popup sukses (SuccessDialog) yang berisi pesan “Login berhasil, selamat datang!”
   - Setelah menekan tombol OK, popup ditutup dan pengguna diarahkan ke halaman ProdukPage.

2. Jika login gagal (kode selain 200 atau terjadi error)
   - Ditampilkan popup peringatan (WarningDialog) dengan pesan “Login gagal, silahkan coba lagi”.
   - Popup ini hanya memberitahu pengguna, tanpa pindah halaman.

# Proses Create Data Produk  
## a. 
<img src="https://github.com/user-attachments/assets/df073db2-4ae5-4c4e-9ea4-c2f387514a70" width="300">
<img src="https://github.com/user-attachments/assets/add60cb3-8e31-4be7-b05f-be2578d0b1cf" width="300">  
<img src="https://github.com/user-attachments/assets/44a665cc-661f-4c5c-9a88-14b37b10988d" width="300">  
<img src="https://github.com/user-attachments/assets/422c0c65-9ab9-48be-a2ca-64be8ce9fb2e" width="300">  

### Penjelasan
Proses tambah data produk di halaman ProdukForm dimulai ketika pengguna mengisi formulir Kode Produk, Nama Produk, dan Harga, lalu menekan tombol SIMPAN. Formulir divalidasi terlebih dahulu untuk memastikan semua field terisi. Jika valid, data dikemas ke dalam objek Produk dan dikirim ke backend melalui ProdukBloc.addProduk. Jika backend merespon berhasil, muncul popup sukses (SuccessDialog) dengan pesan “Produk berhasil ditambahkan”, dan setelah menekan OK, pengguna diarahkan kembali ke halaman ProdukPage. Jika terjadi kesalahan saat penyimpanan, muncul popup peringatan (WarningDialog) dengan pesan “Simpan gagal, silahkan coba lagi”, dan pengguna tetap berada di halaman form.

## b.
<img src="https://github.com/user-attachments/assets/233dc857-27b1-4c26-9b50-2c832161634e" width="300">


### Penjelasan
```
// Jika tambah produk berhasil
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => SuccessDialog(
    description: "Produk berhasil ditambahkan",
    okClick: () {
      Navigator.pop(context); // tutup popup
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ProdukPage()),
        (route) => false,
      );
    },
  ),
);

// Jika tambah produk gagal
showDialog(
  context: context,
  builder: (BuildContext context) => const WarningDialog(
    description: "Simpan gagal, silahkan coba lagi",
  ),
);
```
1. Jika tambah produk berhasil
   - Data produk berhasil dikirim dan disimpan di backend melalui ProdukBloc.addProduk.
   - Ditampilkan popup sukses (SuccessDialog) dengan pesan “Produk berhasil ditambahkan”.
   - Setelah menekan tombol OK, popup ditutup dan pengguna diarahkan ke halaman ProdukPage.
2. Jika tambah produk gagal (terjadi error saat menyimpan ke backend)
   - Ditampilkan popup peringatan (WarningDialog) dengan pesan “Simpan gagal, silahkan coba lagi”.
   - Popup ini hanya memberi informasi kepada pengguna, tanpa berpindah halaman.

# Proses Update Data Produk  
## a. 
<img src="https://github.com/user-attachments/assets/109ed09a-0725-4705-bccf-96c3de270ce4" width="300">
<img src="https://github.com/user-attachments/assets/a763c2ad-6ca1-4cb5-aa83-8f901477c036" width="300">  
<img src="https://github.com/user-attachments/assets/d4a462eb-3a2f-4c61-b9ce-dd224807265a" width="300">
<img src="https://github.com/user-attachments/assets/5e1fae90-8c62-4e8c-a2b1-136ba7d91d3d" width="300">
<img src="https://github.com/user-attachments/assets/332d854c-61d9-4721-8a8e-79744c9aa6ef" width="300">  

### Penjelasan
Proses tambah data produk di halaman ProdukForm dimulai ketika pengguna mengisi formulir Kode Produk, Nama Produk, dan Harga, lalu menekan tombol SIMPAN. Formulir divalidasi terlebih dahulu untuk memastikan semua field terisi. Jika valid, data dikemas ke dalam objek Produk dan dikirim ke backend melalui ProdukBloc.addProduk. Jika backend merespon berhasil, muncul popup sukses (SuccessDialog) dengan pesan “Produk berhasil ditambahkan”, dan setelah menekan OK, pengguna diarahkan kembali ke halaman ProdukPage. Jika terjadi kesalahan saat penyimpanan, muncul popup peringatan (WarningDialog) dengan pesan “Simpan gagal, silahkan coba lagi”, dan pengguna tetap berada di halaman form.

## b.
<img src="https://github.com/user-attachments/assets/adc8a2a5-0529-4126-992a-56d624be8af5" width="300">


### Penjelasan
```
// Jika ubah produk berhasil
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => SuccessDialog(
    description: "Produk berhasil diubah",
    okClick: () {
      Navigator.pop(context); // tutup popup
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ProdukPage()),
        (route) => false,
      );
    },
  ),
);

// Jika ubah produk gagal
showDialog(
  context: context,
  builder: (BuildContext context) => const WarningDialog(
    description: "Permintaan ubah data gagal, silahkan coba lagi",
  ),
);
```
1. Jika ubah produk berhasil
   - Data produk yang diedit berhasil dikirim dan disimpan di backend melalui ProdukBloc.updateProduk.
   - Ditampilkan popup sukses (SuccessDialog) dengan pesan “Produk berhasil diubah”.
   - Setelah menekan tombol OK, popup ditutup dan pengguna diarahkan ke halaman ProdukPage.
2. Jika ubah produk gagal (terjadi error saat update)
   - Ditampilkan popup peringatan (WarningDialog) dengan pesan “Permintaan ubah data gagal, silahkan coba lagi”.
   - Popup ini hanya memberi informasi kepada pengguna, tanpa berpindah halaman.
  
# Proses Delete Data Produk  
## a. 
<img src="https://github.com/user-attachments/assets/998026a0-bac5-40aa-a6de-3e26db82354f" width="300">
<img src="https://github.com/user-attachments/assets/94e8b957-e893-4662-8c73-f00af7b0982b" width="300">  
<img src="https://github.com/user-attachments/assets/36369e7a-d26c-441f-bceb-03c19e7402f8" width="300">
<img src="https://github.com/user-attachments/assets/28a6eea4-6a8d-4569-a901-778e818b44fc" width="300">

### Penjelasan
Proses delete data produk di aplikasi ini biasanya terjadi ketika pengguna memilih produk untuk dihapus dari daftar di ProdukPage. Setelah perintah hapus dijalankan melalui ProdukBloc.deleteProduk, backend akan menghapus data produk berdasarkan ID. Jika proses hapus berhasil, ditampilkan popup sukses (SuccessDialog) dengan pesan “Produk berhasil dihapus”, dan setelah menekan tombol OK, popup ditutup serta daftar produk di-refresh atau diarahkan kembali ke ProdukPage. Jika terjadi error saat proses hapus (misal koneksi gagal atau server bermasalah), ditampilkan popup peringatan (WarningDialog) dengan pesan “Hapus gagal, silahkan coba lagi”, dan pengguna tetap berada di halaman daftar produk.

## b.
<img src="https://github.com/user-attachments/assets/0d1a0a62-27d7-4d1b-ad55-fc2edd39e083" width="300">


### Penjelasan
```
// Jika hapus produk berhasil
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => SuccessDialog(
    description: "Produk berhasil dihapus",
    okClick: () {
      Navigator.pop(context); // tutup popup
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ProdukPage()),
        (route) => false,
      );
    },
  ),
);

// Jika hapus produk gagal
showDialog(
  context: context,
  builder: (BuildContext context) => const WarningDialog(
    description: "Hapus gagal, silahkan coba lagi",
  ),
);
```
1. Jika delete berhasil
   - Data produk berhasil dihapus di backend.
   - Popup sukses (SuccessDialog) muncul dengan pesan “Produk berhasil dihapus”.
   - Setelah menekan OK, popup ditutup dan pengguna diarahkan ke halaman ProdukPage.
2. Jika delete gagal (terjadi error)
   - Popup peringatan (WarningDialog) muncul dengan pesan “Hapus gagal, silahkan coba lagi”.
   - Popup hanya memberitahu pengguna, tanpa pindah halaman.
  
