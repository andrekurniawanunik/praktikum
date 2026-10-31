import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier untuk mengelola state asinkron statistik
class StatsNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    return _fetchStats();
  }

  // Fungsi privat untuk simulasi ambil data dari server/API
  Future<List<String>> _fetchStats() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulasi delay 2 detik

    // Simulasi error sebesar 30%
    if (Random().nextDouble() < 0.3) {
      throw Exception('Gagal terhubung ke server statistik');
    }

    // Data sukses (3 item statistik)
    return [
      'Total Pengguna: 1,250',
      'Pendapatan Bulanan: Rp 15.4 Juta',
      'Pesanan Selesai: 430'
    ];
  }

  // Fungsi untuk memuat ulang data (refresh)
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchStats());
  }
}

// Provider global untuk StatsNotifier
final statsProvider =
    AsyncNotifierProvider<StatsNotifier, List<String>>(
  StatsNotifier.new,
);