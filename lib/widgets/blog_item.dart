import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/detail_bloc/detail_bloc.dart';
import 'package:miniblog/blocs/detail_bloc/detail_event.dart';
import 'package:miniblog/models/blog.dart';
import 'package:miniblog/screens/blog_details.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key, required this.blog}) : super(key: key);
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DetailBloc>().add(ResetEvent());
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DetailPage(
                  id: blog.id!,
                )));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 2,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color.fromARGB(146, 204, 204, 204),
                  ),
                  width: double.infinity,
                  child: Image.network(blog.thumbnail!)),
            ),
            ListTile(
              title: Text(blog.title!),
              subtitle: Text(blog.author!),
            )
          ],
        ),
      ),
    );
  }
}
