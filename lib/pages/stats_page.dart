import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/stats_provider.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Memantau state dari statsProvider
    final statsAsync = ref.watch(statsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik Aplikasi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(statsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: statsAsync.when(
        // Kondisi 1: Saat data sedang dimuat (Loading)
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // Kondisi 2: Saat terjadi error (Error + Tombol Coba Lagi)
        error: (err, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Gagal memuat: $err', textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => ref.invalidate(statsProvider),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
        // Kondisi 3: Saat data berhasil didapat (Success / Data)
        data: (stats) => ListView.builder(
          itemCount: stats.length,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.bar_chart, color: Colors.blue),
              title: Text(stats[index]),
            ),
          ),
        ),
      ),
    );
  }
}