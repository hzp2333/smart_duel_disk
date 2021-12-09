import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../calculator_viewmodel.dart';
import 'calculator.dart';

class CalculatorProvider extends StatelessWidget {
  final double initialValue;

  const CalculatorProvider({
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CalculatorViewModel>(
          create: (_) => CalculatorViewModel(
            initialValue,
            di.get<DialogService>(),
            di.get<Logger>(),
          ),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const Calculator(),
    );
  }
}
