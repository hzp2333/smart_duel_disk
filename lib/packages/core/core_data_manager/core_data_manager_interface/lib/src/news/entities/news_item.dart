import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class NewsItem extends Equatable {
  final String text;
  final String authorName;
  final String authorImageUrl;
  final DateTime createdAt;
  final String imageUrl;

  const NewsItem({
    @required this.text,
    @required this.authorName,
    @required this.authorImageUrl,
    @required this.createdAt,
    @required this.imageUrl,
  });

  @override
  List<Object> get props => [
        text,
        authorName,
        authorImageUrl,
        createdAt,
        imageUrl,
      ];
}
