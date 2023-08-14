import 'package:flutter/material.dart';
import 'package:styli/models/news.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key,
    required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: widget,
    );
  }
}

// Sample new object
final news = News(
  uuid: '12345',
  title: 'News Detail',
  description: 'News description',
  imageUrl:
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn6.aptoide.com%2Fimgs%2F7%2Fa%2Fd%2F7ada31ed1b27d6649d1e67de952ab185_icon.jpg&tbnid=XMMvhJiUGeXzNM&vet=12ahUKEwiCmq2ehNqAAxUWm2MGHSgMA7wQMygDegUIARDmAQ..i&imgrefurl=https%3A%2F%2Fstyli.en.aptoide.com%2Fapp&docid=m0Dxl1TGXU1iXM&w=512&h=512&q=styli&hl=en&ved=2ahUKEwiCmq2ehNqAAxUWm2MGHSgMA7wQMygDegUIARDmAQ',
  publishedAt: DateTime.now(),
);
