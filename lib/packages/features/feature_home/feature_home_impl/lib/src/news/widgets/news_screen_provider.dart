import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../news_viewmodel.dart';
import 'news_screen.dart';

class NewsScreenProvider extends StatelessWidget {
  const NewsScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => NewsViewModel()),
      ],
      child: const NewsScreen(),
    );
  }
}
