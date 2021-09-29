import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../di/ygoprodeck_module.dart';
import '../models/get_speed_duel_cards_response_model.dart';

part 'ygoprodeck_api.g.dart';

@RestApi()
@LazySingleton()
abstract class YgoProDeckRestClient {
  @factoryMethod
  factory YgoProDeckRestClient(@Named(ygoProDeckDioName) Dio dio) = _YgoProDeckRestClient;

  @GET('/cardinfo.php?id={id}')
  Future<GetSpeedDuelCardsResponseModel> getSpeedDuelCard({
    @Path('id') required int id,
  });

  @GET('/cardinfo.php?format=Speed%20Duel')
  Future<GetSpeedDuelCardsResponseModel> getSpeedDuelCards();
}
