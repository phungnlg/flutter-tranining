import 'package:fl_blueprint/app/app_resouces.dart';
import 'package:fl_blueprint/view_models/counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/screen_widget.dart';

class OddNumberList extends HookWidget {
  final oddNumbersProvider = Provider.autoDispose((ref) => ref.watch(counterViewModelProvider).oddNumbers);

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final List<int> oddNumbers = useProvider(oddNumbersProvider);
      //final List<int> oddNumbers = useProvider(counterViewModelProvider).oddNumbers;
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: oddNumbers.length,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: Text(oddNumbers[index].toString(),
                  style: regularSFTextStyle(size: 20.sp, color: Colors.black)
              ),
            );
          },
        ),
      );
    });
  }
}

class EvenNumberList extends HookWidget {
  final evenNumbersProvider = Provider.autoDispose((ref) => ref.watch(counterViewModelProvider).evenNumbers);

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final List<int> evenNumbers = useProvider(evenNumbersProvider);
      //final List<int> evenNumbers = useProvider(counterViewModelProvider).evenNumbers;
      return Expanded(
        child: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: evenNumbers.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Text(evenNumbers[index].toString(),
                      style: regularSFTextStyle(size: 20.sp, color: Colors.black)
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

}

///counter page widget
class CounterPage extends HookWidget {
  final counterValueProvider = Provider.autoDispose((ref) => ref.watch(counterViewModelProvider).counter);
  final oddNumbersProvider = Provider.autoDispose((ref) => ref.watch(counterViewModelProvider).oddNumbers);
  final evenNumbersProvider = Provider.autoDispose((ref) => ref.watch(counterViewModelProvider).evenNumbers);

  Widget buildTextCounter() {
    return HookBuilder(builder: (context) {
      final int counterValue = useProvider(counterValueProvider);
      return Text(' Counter: $counterValue',
          style: regularSFTextStyle(size: 15.sp, color: Colors.black)
      );
    });
  }

  Widget buildOddNumberList() {
    return HookBuilder(builder: (context) {
      //final List<int> oddNumbers = useProvider(oddNumbersProvider);
      final List<int> oddNumbers = useProvider(counterViewModelProvider).oddNumbers;
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: oddNumbers.length,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: Text(oddNumbers[index].toString(),
                  style: regularSFTextStyle(size: 20.sp, color: Colors.black)
              ),
            );
          },
        ),
      );
    });
  }

  Widget builEvenNumberList() {
    return HookBuilder(builder: (context) {
      //final List<int> evenNumbers = useProvider(evenNumbersProvider);
      final List<int> evenNumbers = useProvider(counterViewModelProvider).evenNumbers;
      return Expanded(
        child: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: evenNumbers.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Text(evenNumbers[index].toString(),
                      style: regularSFTextStyle(size: 20.sp, color: Colors.black)
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read(counterViewModelProvider.notifier).increase();
                      },
                      child: Text('+',
                          style: regularSFTextStyle(size: 20.sp, color: Colors.white)
                      )
                  ),
                  buildTextCounter(),
                ],
              ),
            ),
            OddNumberList(),
            EvenNumberList(),
          ],
        ),
      ),
    );
  }
}


