# mbanking_app_flutter

![Powered by Mikumimiestu](https://img.shields.io/badge/CreatedBy-Mikumimiestu%20-ffb6c1?style=flat-square&logo=sparkles&logoColor=white)

Aplikasi Mobile Banking sederhana berbasis Flutter.

## Fitur Utama

- **Tampilan Saldo**: Lihat saldo rekening utama Anda.
- **Transfer Uang**: Kirim uang ke rekening lain dengan mudah.
- **Terima Uang**: Fitur untuk menerima transfer dari pengguna lain.
- **QR Pay**: Pembayaran menggunakan QR code.
- **Riwayat Transaksi**: Lihat daftar transaksi terakhir.
- **Layanan Cepat**: Pembelian pulsa, PLN, PDAM, TV Kabel, BPJS, Voucher, Pinjaman, dan lainnya.

## Struktur Folder

- `lib/`
  - `home_screen.dart` : Halaman utama aplikasi.
  - `page/transfer_page.dart` : Halaman transfer uang.
  - `page/terima_page.dart` : Halaman terima uang.
  - `page/history_page.dart` : Halaman riwayat transaksi.
  - `page/qrpay_page.dart` : Halaman pembayaran QR.

## Cara Menjalankan

1. Pastikan sudah menginstall [Flutter](https://docs.flutter.dev/get-started/install).
2. Jalankan perintah berikut di terminal:
   ```bash
   flutter pub get
   flutter run
   ```

## Asset

Pastikan asset gambar bank sudah didaftarkan di `pubspec.yaml` dan tersedia di folder `assets/`.

## Dokumentasi Flutter

- [Dokumentasi Flutter](https://docs.flutter.dev/)
