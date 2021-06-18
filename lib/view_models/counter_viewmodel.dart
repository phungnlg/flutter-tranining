import 'package:fl_blueprint/app/setup_locator.dart';
import 'package:fl_blueprint/view_state/counter_viewstate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'base/base_viewmodel.dart';
import 'package:domain/domain.dart' as domain;

final counterViewModelProvider =
    StateNotifierProvider.autoDispose<CounterViewModel, CounterViewState>(
        (ref) => locator.get<CounterViewModel>());

class CounterViewModel extends BaseViewModel<CounterViewState> {
  CounterViewModel(
    NavigationService navigationService,
    DialogService dialogService,
  ) : super(CounterViewState(0, [], []), navigationService, dialogService);

  ///increase counter by 1 unit
  void increase() {
    var count = state.counter + 1;
    var evenNumbers = state.evenNumbers;
    var oddNumbers = state.oddNumbers;

    if (count.isEven) {
      evenNumbers.add(count);
    } else {
      oddNumbers.add(count);
    }

    state = CounterViewState(count, evenNumbers, oddNumbers);
  }
}
