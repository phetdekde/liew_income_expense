import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_2/main.dart';

class Income extends ConsumerWidget {
  const Income({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cf = ref.watch(provCashflow);
    return Column(
      children: [
        //บนสุดสีเขียวทั้งแถบ
        GestureDetector(
          onTap: () => ref.read(provCashflow).setPageIndex(),
          child: Container(
            color: Colors.green,
            height: 200,
          ),
        ),
        //สัดส่วนรายรับ
        Container(
          color: Colors.white,
          height: 200,
        ),
        //รายรับจากการทำงาน
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายรับจากการทำงาน',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cf.incWorkingList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 75,
                      height: 75,
                      color: Colors.amber,
                      child: Text(
                        cf.incWorkingList[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //รายรับจากสินทรัพย์
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายรับจากสินทรัพย์',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cf.incAssetList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 75,
                      height: 75,
                      color: Colors.amber,
                      child: Text(
                        cf.incAssetList[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //รายรับอื่นๆ
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายรับอื่นๆ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cf.incOtherList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 75,
                      height: 75,
                      color: Colors.amber,
                      child: Text(
                        cf.incOtherList[index].name,
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
