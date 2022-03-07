import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_test_2/main.dart';
import './income.dart';
import './expense.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cashflow = ref.watch(provCashflow);
    final api = ref.watch(apiCashflow);
    return api.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (val, err) => Text('Error'),
      data: (data) {
        return IndexedStack(
          index: cashflow.pageIndex,
          children: const [
            Income(),
            Expense(),
          ],
        );
      },
    );
  }
}
