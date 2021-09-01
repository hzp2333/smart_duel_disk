import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

@immutable
abstract class PreBuiltDeck extends Equatable {
  final String id;
  final String title;
  final Color backgroundColor;
  final String imageUrl;

  const PreBuiltDeck({
    @required this.id,
    @required this.title,
    @required this.backgroundColor,
    @required this.imageUrl,
  });

  @override
  List<Object> get props => [id, title, backgroundColor, imageUrl];

  @override
  bool get stringify => true;
}

class KaibaDeck extends PreBuiltDeck {
  KaibaDeck()
      : super(
          id: 'Kaiba',
          title: Strings.deckPreBuiltKaibaTitle.get(),
          backgroundColor: AppColors.deckKaibaBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistKaiba.path,
        );
}

class MaiDeck extends PreBuiltDeck {
  MaiDeck()
      : super(
          id: 'Mai',
          title: Strings.deckPreBuiltMaiTitle.get(),
          backgroundColor: AppColors.deckMaiBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistMai.path,
        );
}

class YugiDeck extends PreBuiltDeck {
  YugiDeck()
      : super(
          id: 'Yugi',
          title: Strings.deckPreBuiltYugiTitle.get(),
          backgroundColor: AppColors.deckYugiBackgroundColor,
          imageUrl: Assets.illustrations.duelists.duelistYugi.path,
        );
}
