import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'rows/hand_row.dart';
import 'rows/main_monster_row.dart';
import 'rows/spell_trap_row.dart';

class SpeedDuelField extends StatelessWidget {
  final SpeedDuelState state;

  const SpeedDuelField({
    @required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PlayerField(playerState: state.opponentState),
          _PlayerField(playerState: state.userState),
        ],
      ),
    );
  }
}

class _PlayerField extends StatelessWidget {
  final PlayerState playerState;

  const _PlayerField({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<PlayerState>.value(
      value: playerState,
      child: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.screenMargin),
          child: RotatedBox(
            quarterTurns: playerState.isOpponent ? 2 : 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Expanded(child: MainMonsterRow()),
                SizedBox(height: AppDimensions.duelFieldSecondHandRowSpacing),
                Expanded(child: SpellTrapRow()),
                SizedBox(height: AppDimensions.duelFieldFirstSecondRowSpacing),
                Expanded(child: HandRow()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
