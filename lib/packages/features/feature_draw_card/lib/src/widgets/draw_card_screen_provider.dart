import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/src/draw_card_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/src/widgets/draw_card_screen.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

class DrawCardScreenProvider extends StatelessWidget {
  const DrawCardScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<DrawCardViewModel>()),
        Provider(create: (_) => di.get<AssetsProvider>()),
      ],
      child: const DrawCardScreen(),
    );
  }
}
