# Laporan Tugas AI Challenge

## 1. Prompt yang Digunakan
> "Buatkan halaman Flutter bernama StatsPage menggunakan flutter_riverpod. Requirements: ConsumerWidget dengan satu AsyncNotifierProvider yang mensimulasikan pengambilan data statistik (delay 2 detik, kadang gagal 30%). UI harus menangani loading (spinner), error (pesan + tombol retry), dan success (ListView 3 item). Berikan unit test untuk notifier-nya. Jelaskan setiap bagian kode dalam komentar."

## 2. Checklist Verifikasi
- State dikembalikan secara immutable menggunakan `AsyncValue`.
- `ref.watch` hanya dipakai di dalam method `build()`, sedangkan `ref.read` atau `ref.invalidate` di dalam callback tombol.
- Ketiga state (`loading`, `error`, `data`) ditangani dengan lengkap menggunakan `.when()`.
- Menggunakan arsitektur `AsyncNotifier` terbaru dan bersih dari *anti-pattern*.

## 3. Hasil Pengujian
- Unit test pada `stats_provider_test.dart` berhasil dijalankan dan lolos pengujian tanpa error.