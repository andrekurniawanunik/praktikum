import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pml/providers/stats_provider.dart'; // Sesuaikan nama package jika berbeda

void main() {
  test('StatsNotifier initial state test', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // Memastikan provider dapat dibaca dan menghasilkan AsyncValue
    expect(
      container.read(statsProvider),
      isA<AsyncValue<List<String>>>(),
    );
  });
}