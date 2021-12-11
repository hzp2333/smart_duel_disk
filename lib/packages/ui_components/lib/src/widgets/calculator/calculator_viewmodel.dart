import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

class CalculatorViewModel extends BaseViewModel {
  static const _tag = 'CalculatorViewModel';

  final DialogService _dialogService;

  final BehaviorSubject<double> _calculatorValue;
  Stream<double> get calculatorValue => _calculatorValue.stream;

  CalculatorViewModel(
    double _initialValue,
    this._dialogService,
    Logger logger,
  )   : _calculatorValue = BehaviorSubject<double>.seeded(_initialValue),
        super(logger);

  void onValueChanged(String? key, double? value, String? expression) {
    logger.info(_tag, 'onValueChanged(key: $key, value: $value, expression: $expression)');

    if (value == null) {
      return;
    }

    _calculatorValue.safeAdd(value);

    if (key == '=') {
      _dialogService.popDialog(value);
    }
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    super.dispose();
  }
}
