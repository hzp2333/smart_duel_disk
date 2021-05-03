import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_list_item.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import '../models/news_state.dart';
import '../news_viewmodel.dart';
import 'widgets/news_list.dart';
import 'widgets/social_media_header.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen();

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<NewsViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context);

    return StreamBuilder<NewsState>(
      stream: vm.newsState,
      initialData: const Loading(),
      builder: (context, snapshot) {
        return snapshot.data.when(
          (news) => _DataBody(newsItems: news),
          loading: () => const _LoadingBody(),
          error: () => const _ErrorBody(),
        );
      },
    );
  }
}

class _DataBody extends StatelessWidget {
  final Iterable<NewsListItem> newsItems;

  const _DataBody({
    @required this.newsItems,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.screenMargin),
      child: ScrollConfiguration(
        behavior: const NoScrollGlowBehavior(),
        child: RefreshIndicator(
          onRefresh: vm.onRefresh,
          color: AppColors.primaryAccentColor,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.screenMargin),
            child: Column(
              children: [
                SocialMediaHeader(),
                NewsList(newsItems: newsItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaHeader(),
        const Expanded(
          child: GeneralLoadingState(),
        ),
      ],
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context);

    return Column(
      children: [
        SocialMediaHeader(),
        Expanded(
          child: GeneralErrorState(
            description: Strings.newsGeneralErrorDescription.get(),
            canRetry: true,
            retryAction: vm.onRetryPressed,
          ),
        ),
      ],
    );
  }
}
