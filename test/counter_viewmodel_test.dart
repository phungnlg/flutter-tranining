import 'package:fl_blueprint/services/dialog_service.dart';
import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:fl_blueprint/view_models/counter_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_viewmodel_test.mocks.dart';

@GenerateMocks([NavigationService])
@GenerateMocks([DialogService])
void main() {
  var mockDialogService = MockDialogService();
  var mockNavigationService = MockNavigationService();

  group('counter view model test', () {
    setUpAll(() async {
      mockNavigationService = MockNavigationService();
      mockDialogService = MockDialogService();

      when(mockDialogService.showLoading()).thenAnswer((_) async {});
      when(mockDialogService.hideLoading()).thenAnswer((_) {});
      when(mockNavigationService.pushNamed(any))
          .thenAnswer((_) => Future.value());
    });

    test('increase true', () {
      //Arrange
      final counterViewModel =
          CounterViewModel(mockNavigationService, mockDialogService);

      //Act
      counterViewModel.increase();

      //Assert
      expect(counterViewModel.state.counter, 1);
    });

    test('increase false', () {
      //Arrange
      final counterViewModel =
          CounterViewModel(mockNavigationService, mockDialogService);

      //Act
      counterViewModel.increase();

      //Assert
      var count = counterViewModel.state.counter != 1;
      expect(count, false);
    });
  });
}
