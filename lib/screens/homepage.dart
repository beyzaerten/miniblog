import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/models/blog.dart';
import 'package:miniblog/repositories/article_repository.dart';

import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/screens/blog_details.dart';
import 'package:miniblog/widgets/blog_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  void fetchAgain() {
    context.read<ArticleBloc>().add(FetchArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Bloglar"),
        actions: [
          IconButton(
              onPressed: () async {
                bool? result = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const AddBlog()));

                if (result == true) {
                  context.read<ArticleBloc>().add(FetchArticles());
                }
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticlesInitial &&
            state is! ArticlesLoading &&
            state is! ArticlesLoaded) {
          // bloca fetcharticle eventi gönderelim ki uia bloglar gelsin
          context.read<ArticleBloc>().add(FetchArticles());
          return const Center(
            child: Text("İstek atılıyor..."),
          );
        }
        if (state is ArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ArticlesLoaded) {
          return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) => BlogItem(
                    blog: state.blogs[index],
                  ));
        }

        if (state is ArticlesError) {
          return const Center(
            child: Text("hata"),
          );
        }

        return const Center(
          child: Text("Unknown State"),
        );
      }),
    );
  }
}
