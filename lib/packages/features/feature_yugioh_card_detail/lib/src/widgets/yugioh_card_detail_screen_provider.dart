import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../yugioh_card_detail_viewmodel.dart';
import 'yugioh_card_detail_screen.dart';

class YugiohCardDetailScreenProvider extends StatelessWidget {
  final CardCopy cardCopy;
  final String tag;

  const YugiohCardDetailScreenProvider({
    required this.cardCopy,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => di.get<YugiohCardDetailViewModel>(
            param1: cardCopy,
            param2: tag,
          ),
        ),
      ],
      child: const YugiohCardDetailScreen(),
    );
  }
}
