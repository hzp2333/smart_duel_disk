import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../news_viewmodel.dart';
import 'news_screen.dart';

class NewsScreenProvider extends StatelessWidget {
  const NewsScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NewsViewModel>(
          create: (_) => di.get<NewsViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const NewsScreen(),
    );
  }
}
