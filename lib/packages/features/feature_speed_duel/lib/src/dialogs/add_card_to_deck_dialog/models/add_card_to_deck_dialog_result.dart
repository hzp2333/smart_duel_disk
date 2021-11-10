import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_result.dart';

abstract class AddCardToDeckDialogResult extends SpeedDuelDialogResult {
  final bool shuffle;

  const AddCardToDeckDialogResult({
    required this.shuffle,
  }) : super();

  @override
  List<Object?> get props => [
        shuffle,
      ];

  @override
  bool? get stringify => true;
}

class AddToTopOfDeck extends AddCardToDeckDialogResult {
  const AddToTopOfDeck() : super(shuffle: false);
}

class AddToBottomOfDeck extends AddCardToDeckDialogResult {
  const AddToBottomOfDeck() : super(shuffle: false);
}

class AddToDeckAndShuffle extends AddCardToDeckDialogResult {
  const AddToDeckAndShuffle() : super(shuffle: true);
}
