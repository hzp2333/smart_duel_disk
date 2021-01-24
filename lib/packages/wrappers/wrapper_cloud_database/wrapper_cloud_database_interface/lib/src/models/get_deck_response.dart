import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_deck_response.freezed.dart';
part 'get_deck_response.g.dart';

@freezed
abstract class GetDeckResponse with _$GetDeckResponse {
  const factory GetDeckResponse({
    @required List<int> cardIds,
  }) = _GetDeckResponse;

  factory GetDeckResponse.fromJson(Map<String, dynamic> json) => _$GetDeckResponseFromJson(json);
}
