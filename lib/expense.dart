import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_2/main.dart';

class Expense extends ConsumerWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cf = ref.watch(provCashflow);
    return Column(
      children: [
        //บนสุดสีแดงทั้งแถบ
        GestureDetector(
          onTap: () => ref.read(provCashflow).setPageIndex(),
          child: Container(
            color: Colors.red,
            height: 200,
          ),
        ),
        //สัดส่วนรายจ่าย
        Container(
          color: Colors.white,
          height: 200,
        ),
        //รายจ่ายไม่คงที่
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายจ่ายไม่คงที่',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cf.expInconsistencyList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 75,
                      height: 75,
                      color: Colors.amber,
                      child: Text(
                        cf.expInconsistencyList[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //รายจ่ายคงที่
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายจ่ายคงที่',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cf.expConsistencyList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 75,
                      height: 75,
                      color: Colors.amber,
                      child: Text(
                        cf.expConsistencyList[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //การออมและการลงทุน
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'การออมและการลงทุน',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cf.expSavInvList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 75,
                      height: 75,
                      color: Colors.amber,
                      child: Text(
                        cf.expSavInvList[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
