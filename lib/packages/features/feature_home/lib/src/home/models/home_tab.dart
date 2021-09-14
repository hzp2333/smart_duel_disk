import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@immutable
abstract class HomeTab extends Equatable {
  final String titleId;
  final IconData icon;
  final PageRouteInfo page;

  const HomeTab({
    required this.titleId,
    required this.icon,
    required this.page,
  });

  @override
  List<Object?> get props => [
        titleId,
        icon,
        page,
      ];

  @override
  bool? get stringify => true;
}

class NewsHomeTab extends HomeTab {
  const NewsHomeTab()
      : super(
          titleId: LocaleKeys.home_tab_news,
          icon: Icons.wysiwyg_outlined,
          page: const NewsTab(),
        );
}

class DeckHomeTab extends HomeTab {
  const DeckHomeTab()
      : super(
          titleId: LocaleKeys.home_tab_deck,
          icon: Icons.account_balance_wallet_outlined,
          page: const DeckTab(),
        );
}

class DuelHomeTab extends HomeTab {
  const DuelHomeTab()
      : super(
          titleId: LocaleKeys.home_tab_duel,
          icon: Icons.sports_esports,
          page: const DuelTab(),
        );
}
