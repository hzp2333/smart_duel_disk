import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

import '../calculator_viewmodel.dart';

class Calculator extends StatelessWidget {
  const Calculator();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CalculatorViewModel>(context);

    return SizedBox(
      height: context.screenHeight * 0.75,
      child: StreamBuilder<double>(
        stream: vm.calculatorValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }

          return SimpleCalculator(
            value: snapshot.requireData,
            hideSurroundingBorder: true,
            onChanged: vm.onValueChanged,
            theme: const CalculatorThemeData(
              borderWidth: 2.0,
              borderColor: Colors.black,
              displayColor: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
