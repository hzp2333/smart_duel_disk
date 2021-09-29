import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class YugiohCardDetailScreen extends StatelessWidget {
  const YugiohCardDetailScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
      backgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<YugiohCardDetailViewModel>(context);

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryBackgroundColor,
      leading: const BackButton(color: AppColors.primaryIconColor),
      title: Text(
        vm.cardCopy.card.name,
        style: const TextStyle(color: AppColors.primaryIconColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<YugiohCardDetailViewModel>(context);
    final cardCopy = vm.cardCopy;

    return InteractiveViewer(
      child: Center(
        child: Hero(
          tag: vm.tag,
          child: CardImage(
            card: cardCopy.card,
            image: cardCopy.image,
          ),
        ),
      ),
    );
  }
}
