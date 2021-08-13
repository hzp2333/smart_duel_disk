// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ygoprodeck_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _YgoProDeckRestClient implements YgoProDeckRestClient {
  _YgoProDeckRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<GetSpeedDuelCardsResponseModel> getSpeedDuelCards() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/cardinfo.php?format=Speed%20Duel',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetSpeedDuelCardsResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetSpeedDuelCardsResponseModel> getToken() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/cardinfo.php?name=Sheep%20Token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetSpeedDuelCardsResponseModel.fromJson(_result.data);
    return value;
  }
}
