import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_list_item.dart';

extension NewsItemExtensions on NewsItem {
  NewsListItem toNewsListItem(DateFormatter dateFormatter) {
    return NewsListItem(
      id: id,
      text: text,
      authorId: authorId,
      authorName: authorName,
      authorImageUrl: authorImageUrl,
      createdAt: dateFormatter.formatWithFullMonthName(createdAt),
      imageUrl: imageUrl,
    );
  }
}
