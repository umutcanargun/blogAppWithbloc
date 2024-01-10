import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog, this.onTap});

  final Blog blog;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 4 / 2,
                  child: Container(
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Center(child: Image.network(blog.thumbnail!)))),
              ListTile(
                title: Text(blog.title!),
                subtitle: Text(blog.author!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
