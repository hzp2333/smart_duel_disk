import 'package:dart_twitter_api/twitter_api.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_twitter_provider/wrapper_twitter_provider_interface/lib/src/twitter_provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

@LazySingleton(as: TwitterProvider)
class TwitterProviderImpl implements TwitterProvider {
  final TwitterApi _twitterApi;

  TwitterProviderImpl(
    this._twitterApi,
  );

  @override
  Future<List<NewsItem>> getUserTweets(String userId, [int count = 200]) async {
    final newsItems = <NewsItem>[];

    final tweets = await _twitterApi.timelineService.userTimeline(userId: userId, count: count);

    for (final tweet in tweets) {
      final imageUrl = tweet.entities.media.isNullOrEmpty ? null : tweet.entities.media.first.mediaUrlHttps;

      newsItems.add(NewsItem(
        id: tweet.idStr,
        text: tweet.fullText,
        authorId: tweet.user.screenName,
        authorName: tweet.user.name,
        authorImageUrl: tweet.user.profileImageUrlHttps,
        createdAt: tweet.createdAt,
        imageUrl: imageUrl,
      ));
    }

    return newsItems;
  }
}
