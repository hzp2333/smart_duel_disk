import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_list_item.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/news_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class NewsList extends StatelessWidget {
  final Iterable<NewsListItem> newsItems;

  const NewsList({
    required this.newsItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.newsListPaddingVertical),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsItems.length,
        itemBuilder: (_, index) => _NewsListItemBuilder(newsItem: newsItems.elementAt(index)),
        separatorBuilder: (_, __) => const SizedBox(height: AppSizes.newsListItemSeparatorSize),
      ),
    );
  }
}

class _NewsListItemBuilder extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemBuilder({
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _NewsListItem(newsItem: newsItem),
        Positioned.fill(
          child: _NewsListItemRipple(newsItem: newsItem),
        ),
      ],
    );
  }
}

class _NewsListItem extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItem({
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppElevations.newsCardElevation,
      color: AppColors.cardBackgroundColor,
      margin: const EdgeInsets.all(AppSizes.newsCardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
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
  final String? imageUrl;

  const _NewsListItemImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppSizes.newsCardImageAspectRatio,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.generalBorderRadius),
          topRight: Radius.circular(AppSizes.generalBorderRadius),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class _NewsListItemHeader extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemHeader({
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardHeaderBackgroundColor,
        borderRadius: !newsItem.hasImage
            ? const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.generalBorderRadius),
                topRight: Radius.circular(AppSizes.generalBorderRadius),
              )
            : null,
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSizes.newsCardPadding,
        AppSizes.newsCardPadding,
        AppSizes.newsCardPadding,
        AppSizes.titleDescriptionSpacing / 2,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _NewsListItemAuthor(newsItem: newsItem),
          ),
          const SizedBox(width: AppSizes.newsCardAuthorDateSpacing),
          _NewsListItemDate(createdAt: newsItem.createdAt),
        ],
      ),
    );
  }
}

class _NewsListItemAuthor extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemAuthor({
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(newsItem.authorImageUrl!),
          radius: AppSizes.newsCardAuthorImageRadius,
        ),
        const SizedBox(width: AppSizes.newsCardAuthorImageNameSpacing),
        AutoSizeText(
          newsItem.authorName!,
          style: TextStyles.subtitle,
          maxLines: 1,
        ),
      ],
    );
  }
}

class _NewsListItemDate extends StatelessWidget {
  final String createdAt;

  const _NewsListItemDate({
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      createdAt,
      style: TextStyles.newsCardDate,
      maxLines: 1,
    );
  }
}

class _NewsListItemText extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemText({
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.newsCardPadding,
        AppSizes.titleDescriptionSpacing / 2,
        AppSizes.newsCardPadding,
        AppSizes.newsCardPadding,
      ),
      child: Text(newsItem.text!),
    );
  }
}

class _NewsListItemRipple extends StatelessWidget {
  final NewsListItem newsItem;

  const _NewsListItemRipple({
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context);

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.newsCardMargin),
        child: InkWell(
          onTap: () => vm.onNewsItemTapped(newsItem),
          highlightColor: Colors.transparent,
          splashColor: AppColors.cardSplashColor,
          borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
        ),
      ),
    );
  }
}
