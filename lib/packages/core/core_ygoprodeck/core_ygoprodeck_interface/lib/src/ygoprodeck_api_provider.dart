import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

abstract class YgoProDeckApiProvider {
  Future<Iterable<YugiohCard>> getSpeedDuelCards();
  Future<YugiohCard> getToken();
}
