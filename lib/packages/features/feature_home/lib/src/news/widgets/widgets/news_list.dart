import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_list_item.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class NewsList extends StatelessWidget {
  final Iterable<NewsListItem> newsItems;

  const NewsList({
    @required this.newsItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsItems.length,
        itemBuilder: (_, index) => _NewsListItem(newsItem: newsItems.elementAt(index)),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}

class _NewsListItem extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItem({
    @required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          if (newsItem.imageUrl != null) ...{
            _NewsListItemImage(imageUrl: newsItem.imageUrl),
          },
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _NewsListItemAuthor(newsItem: newsItem),
                    ),
                    const SizedBox(width: 12),
                    Text(newsItem.createdAt),
                  ],
                ),
                const SizedBox(height: 8),
                Text(newsItem.text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsListItemAuthor extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemAuthor({
    @required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(newsItem.authorImageUrl),
          radius: 16,
        ),
        const SizedBox(width: 8),
        Text(
          newsItem.authorName,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class _NewsListItemImage extends StatelessWidget {
  final String imageUrl;

  const _NewsListItemImage({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
