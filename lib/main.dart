import 'package:flutter/material.dart';
import 'package:flutter_test_2/model/category.dart';
import 'package:flutter_test_2/myhome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_2/provider/cashflow_provider.dart';

final provCashflow = ChangeNotifierProvider.autoDispose<CashFlow>((ref) {
  print('PROVIDER HAS BEEN CREATED');
  return CashFlow();
});

final apiCashflow = FutureProvider.autoDispose<List<Category>>((ref) async {
  final data = await Future.delayed(
    const Duration(seconds: 1),
    () => [
      Category(
        name: 'เงินเดือน',
        icon: 'briefcase',
        active: true,
        cost: 15000,
        ftype: '1',
      ),
      Category(
        name: 'something',
        icon: 'briefcase',
        active: true,
        cost: 10000,
        ftype: '1',
      ),
      Category(
        name: 'ดอกเบี้ย',
        icon: '...',
        active: false,
        cost: 0,
        ftype: '2',
      )
    ],
  );
  ref.read(provCashflow).setCatList(data);
  ref.read(provCashflow).setCatType();
  return data;
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
