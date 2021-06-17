import 'package:domain/domain.dart';
import 'package:domain/src/repositories/counter_repository.dart';

class IncreaseCounterUseCase extends BaseUseCase<int, void> {

  final CounterRepository _counterRepository;
  IncreaseCounterUseCase(this._counterRepository);

  @override
  Future<int> perform({void param}) async {
    try {
      return _counterRepository.increaseCounter();
    } catch (e) {
      return -1;
    }
  }
}