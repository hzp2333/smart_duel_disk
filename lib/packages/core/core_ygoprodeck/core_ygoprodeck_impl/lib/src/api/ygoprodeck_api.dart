import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart';

part 'ygoprodeck_api.g.dart';

@RestApi()
@LazySingleton()
abstract class YgoProDeckRestClient {
  @factoryMethod
  factory YgoProDeckRestClient(Dio dio) = _YgoProDeckRestClient;

  @GET('/cardinfo.php?format=Speed%20Duel')
  Future<GetSpeedDuelCardsResponseModel> getSpeedDuelCards();
}
