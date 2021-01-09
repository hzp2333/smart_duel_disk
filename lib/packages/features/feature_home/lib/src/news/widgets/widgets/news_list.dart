import 'package:cached_network_image/cached_network_image.dart';
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
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.newsListPaddingVertical),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsItems.length,
        itemBuilder: (_, index) => _NewsListItemBuilder(newsItem: newsItems.elementAt(index)),
        separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.newsListItemSeparatorSize),
      ),
    );
  }
}

class _NewsListItemBuilder extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemBuilder({
    @required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _NewsListItem(newsItem: newsItem),
        const Positioned.fill(
          child: _NewsListItemRipple(),
        ),
      ],
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
      elevation: AppElevations.newsCardElevation,
      color: AppColors.cardBackgroundColor,
      margin: const EdgeInsets.all(AppDimensions.newsCardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.newsCardBorderRadius),
      ),
      child: Column(
        children: <Widget>[
          if (newsItem.hasImage) ...{
            _NewsListItemImage(imageUrl: newsItem.imageUrl),
          },
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _NewsListItemHeader(newsItem: newsItem),
              _NewsListItemText(newsItem: newsItem),
            ],
          ),
        ],
      ),
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
      aspectRatio: AppDimensions.newsCardImageAspectRatio,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.newsCardBorderRadius),
          topRight: Radius.circular(AppDimensions.newsCardBorderRadius),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class _NewsListItemHeader extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemHeader({
    @required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardHeaderBackgroundColor,
        borderRadius: !newsItem.hasImage
            ? const BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.newsCardBorderRadius),
                topRight: Radius.circular(AppDimensions.newsCardBorderRadius),
              )
            : null,
      ),
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.newsCardPadding,
        AppDimensions.newsCardPadding,
        AppDimensions.newsCardPadding,
        AppDimensions.titleDescriptionSpacing / 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: <Widget>[
          Expanded(
            child: _NewsListItemAuthor(newsItem: newsItem),
          ),
          const SizedBox(width: AppDimensions.newsCardAuthorDateSpacing),
          _NewsListItemDate(createdAt: newsItem.createdAt),
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
          backgroundImage: CachedNetworkImageProvider(newsItem.authorImageUrl),
          radius: AppDimensions.newsCardAuthorImageRadius,
        ),
        const SizedBox(width: AppDimensions.newsCardAuthorImageNameSpacing),
        Text(
          newsItem.authorName,
          style: TextStyles.cardTitle,
        ),
      ],
    );
  }
}

class _NewsListItemDate extends StatelessWidget {
  final String createdAt;

  const _NewsListItemDate({
    @required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      createdAt,
      style: TextStyles.cardDate,
    );
  }
}

class _NewsListItemText extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemText({
    @required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.newsCardPadding,
        AppDimensions.titleDescriptionSpacing / 2,
        AppDimensions.newsCardPadding,
        AppDimensions.newsCardPadding,
      ),
      child: Text(newsItem.text),
    );
  }
}

class _NewsListItemRipple extends StatelessWidget {
  const _NewsListItemRipple();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.newsCardMargin),
        child: InkWell(
          onTap: () {},
          highlightColor: Colors.transparent,
          splashColor: AppColors.cardSplashColor,
          borderRadius: BorderRadius.circular(AppDimensions.newsCardBorderRadius),
        ),
      ),
    );
  }
}
