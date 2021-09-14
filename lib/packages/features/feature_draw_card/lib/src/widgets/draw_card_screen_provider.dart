import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/src/draw_card_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/src/widgets/draw_card_screen.dart';
import 'package:smart_duel_disk/src/di/di.dart';

class DrawCardScreenProvider extends StatelessWidget {
  final VoidCallback cardDrawnCallback;

  const DrawCardScreenProvider({
    required this.cardDrawnCallback,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => DrawCardViewModel(
            cardDrawnCallback,
            di.get<AppRouter>(),
            di.get<Logger>(),
          ),
        ),
      ],
      child: const DrawCardScreen(),
    );
  }
}
