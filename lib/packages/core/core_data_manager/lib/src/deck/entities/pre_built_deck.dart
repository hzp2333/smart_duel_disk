import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

@immutable
abstract class PreBuiltDeck extends Equatable {
  final String id;
  final String titleId;
  final Color backgroundColor;
  final String imageUrl;

  const PreBuiltDeck({
    required this.id,
    required this.titleId,
    required this.backgroundColor,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
        id,
        titleId,
        backgroundColor,
        imageUrl,
      ];

  @override
  bool get stringify => true;
}

class TestDeck extends PreBuiltDeck {
  TestDeck()
      : super(
          id: 'Test',
          titleId: LocaleKeys.deck_pre_built_test_title,
          backgroundColor: AppColors.deckTestBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistTest.path,
        );
}

class KaibaDeck extends PreBuiltDeck {
  KaibaDeck()
      : super(
          id: 'Kaiba',
          titleId: LocaleKeys.deck_pre_built_kaiba_title,
          backgroundColor: AppColors.deckKaibaBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistKaiba.path,
        );
}

class MaiDeck extends PreBuiltDeck {
  MaiDeck()
      : super(
          id: 'Mai',
          titleId: LocaleKeys.deck_pre_built_mai_title,
          backgroundColor: AppColors.deckMaiBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistMai.path,
        );
}

class YugiDeck extends PreBuiltDeck {
  YugiDeck()
      : super(
          id: 'Yugi',
          titleId: LocaleKeys.deck_pre_built_yugi_title,
          backgroundColor: AppColors.deckYugiBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistYugi.path,
        );
}
