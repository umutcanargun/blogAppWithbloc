import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/detail_bloc/detail_bloc.dart';
import 'package:miniblog/blocs/detail_bloc/detail_event.dart';
import 'package:miniblog/blocs/detail_bloc/detail_state.dart';
import 'package:miniblog/models/blog.dart';

class BlogDetail extends StatefulWidget {
  final String? id;

  const BlogDetail({super.key, required this.id});

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  Blog? blog;

  @override
  void initState() {
    super.initState();
   
  }

 

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  if (state is DetailInitial) {
                    context
                        .read<DetailBloc>()
                        .add(FetchArticleByID(id: widget.id ?? ""));
                    return const Center(child: Text("İstek atılıyor..."));
                  }

                  if (state is DetailLoading) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is DetailLoaded) {
                    blog = state.blog;
                    return Scaffold(
                      appBar: AppBar(
                        title: blog == null
                            ? null
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(blog?.title ?? "")),
                        automaticallyImplyLeading: true,
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            context.read<ArticleBloc>().add(FetchArticles());
                            Navigator.pop(context, true);
                          },
                        ),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 4 / 3,
                              child: Image.network(blog?.thumbnail ?? ""),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              blog?.title ?? "",
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              blog?.content ?? "",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Yazar : ${blog?.author ?? ""}",
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 16))
                          ],
                        ),
                      ),
                    );
                  }

                  if (state is DetailError) {
                    return const Center(
                      child: Text("Bloglar yüklenirken bir hata oluştu."),
                    );
                  }

                  return const Center(
                    child: Text("Unknown State"),
                  );
                },
              
    );
  }
}
