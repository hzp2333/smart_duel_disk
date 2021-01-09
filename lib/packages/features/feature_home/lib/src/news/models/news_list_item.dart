import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class NewsListItem extends Equatable {
  final String id;
  final String text;
  final String authorId;
  final String authorName;
  final String authorImageUrl;
  final String createdAt;
  final String imageUrl;

  const NewsListItem({
    @required this.id,
    @required this.text,
    @required this.authorId,
    @required this.authorName,
    @required this.authorImageUrl,
    @required this.createdAt,
    @required this.imageUrl,
  });

  @override
  List<Object> get props => [
        id,
        text,
        authorId,
        authorName,
        authorImageUrl,
        createdAt,
        imageUrl,
      ];

  @override
  bool get stringify => true;
}
