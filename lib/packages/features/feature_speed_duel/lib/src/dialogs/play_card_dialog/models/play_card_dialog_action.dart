import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';

import 'play_card_dialog_result.dart';

abstract class PlayCardDialogAction extends SpeedDuelDialogAction {
  const PlayCardDialogAction({
    required String name,
    required IconData icon,
    required PlayCardDialogResult result,
  }) : super(
          name: name,
          icon: icon,
          result: result,
        );
}

class NormalSummonAction extends PlayCardDialogAction {
  const NormalSummonAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_normal_summon,
          icon: FontAwesomeIcons.caretSquareUp,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUp,
            playType: CardPlayType.normalSummon,
          ),
        );
}

class FlipSummonAction extends PlayCardDialogAction {
  const FlipSummonAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_flip_summon,
          icon: FontAwesomeIcons.caretSquareUp,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUp,
            playType: CardPlayType.normalSummon,
          ),
        );
}

class SpecialSummonAttackAction extends PlayCardDialogAction {
  const SpecialSummonAttackAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_summon_attack,
          icon: FontAwesomeIcons.gavel,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUp,
            playType: CardPlayType.specialSummon,
          ),
        );
}

class SpecialSummonDefenceAction extends PlayCardDialogAction {
  const SpecialSummonDefenceAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_summon_defence,
          icon: FontAwesomeIcons.shieldAlt,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUpDefence,
            playType: CardPlayType.specialSummon,
          ),
        );
}

class SetMonsterAction extends PlayCardDialogAction {
  const SetMonsterAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_set,
          icon: FontAwesomeIcons.caretSquareDown,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceDownDefence,
            playType: CardPlayType.set,
          ),
        );
}

class SetSpellTrapAction extends PlayCardDialogAction {
  const SetSpellTrapAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_set,
          icon: FontAwesomeIcons.caretSquareDown,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceDown,
            playType: CardPlayType.set,
          ),
        );
}

class ActivateAction extends PlayCardDialogAction {
  const ActivateAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_activate,
          icon: FontAwesomeIcons.fireAlt,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUp,
            playType: CardPlayType.activate,
          ),
        );
}

class ToAttackAction extends PlayCardDialogAction {
  const ToAttackAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_to_attack,
          icon: FontAwesomeIcons.gavel,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUp,
          ),
        );
}

class ToDefenceAction extends PlayCardDialogAction {
  const ToDefenceAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_to_defence,
          icon: FontAwesomeIcons.shieldAlt,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUpDefence,
          ),
        );
}

class FlipAction extends PlayCardDialogAction {
  const FlipAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_flip,
          icon: FontAwesomeIcons.undoAlt,
          result: const PlayCardUpdatePosition(
            position: CardPosition.faceUpDefence,
          ),
        );
}

class DestroyAction extends PlayCardDialogAction {
  const DestroyAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_destroy,
          icon: FontAwesomeIcons.bomb,
          result: const PlayCardUpdatePosition(
            position: CardPosition.destroy,
          ),
        );
}

class DeclareAction extends PlayCardDialogAction {
  const DeclareAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_declare,
          icon: FontAwesomeIcons.bullhorn,
          result: const PlayCardDeclare(),
        );
}

class AddCounterAction extends PlayCardDialogAction {
  const AddCounterAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_add_counter,
          icon: FontAwesomeIcons.plusCircle,
          result: const PlayCardAddCounter(),
        );
}

class RemoveCounterAction extends PlayCardDialogAction {
  const RemoveCounterAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_remove_counter,
          icon: FontAwesomeIcons.minusCircle,
          result: const PlayCardRemoveCounter(),
        );
}

class RevealCardAction extends PlayCardDialogAction {
  const RevealCardAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_reveal,
          icon: FontAwesomeIcons.eye,
          result: const PlayCardReveal(),
        );
}

class HideCardAction extends PlayCardDialogAction {
  const HideCardAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_hide,
          icon: FontAwesomeIcons.eyeSlash,
          result: const PlayCardHide(),
        );
}

class GiveToOpponentAction extends PlayCardDialogAction {
  const GiveToOpponentAction()
      : super(
          name: LocaleKeys.speed_duel_card_action_give_to_opponent,
          icon: FontAwesomeIcons.handshake,
          result: const PlayCardGiveToOpponent(),
        );
}
