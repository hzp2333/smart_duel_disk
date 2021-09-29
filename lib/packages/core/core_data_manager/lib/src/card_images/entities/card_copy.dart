import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:universal_io/io.dart';

@immutable
class CardCopy extends Equatable {
  final YugiohCard card;
  final File? image;

  const CardCopy(
    this.card,
    this.image,
  );

  @override
  List<Object?> get props => [
        card,
        image,
      ];

  @override
  bool? get stringify => true;
}
