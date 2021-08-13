import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class NewsItem extends Equatable {
  final String id;
  final String text;
  final String authorId;
  final String authorName;
  final String authorImageUrl;
  final DateTime createdAt;
  final String imageUrl;

  const NewsItem({
    @required this.id,
    @required this.text,
    @required this.authorId,
    @required this.authorName,
    @required this.authorImageUrl,
    @required this.createdAt,
    @required this.imageUrl,
  });

  NewsItem copyWith({String text}) {
    return NewsItem(
      id: id,
      text: text ?? this.text,
      authorId: authorId,
      authorName: authorName,
      authorImageUrl: authorImageUrl,
      createdAt: createdAt,
      imageUrl: imageUrl,
    );
  }

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
