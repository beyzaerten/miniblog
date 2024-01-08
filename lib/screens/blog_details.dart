import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/blocs/detail_bloc/detail_bloc.dart';
import 'package:miniblog/blocs/detail_bloc/detail_event.dart';
import 'package:miniblog/blocs/detail_bloc/detail_state.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});
  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
        if (state is DetailInitial) {
          context.read<DetailBloc>().add(FetchDetailById(id: widget.id));
        }
        if (state is DetailLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DetailLoaded) {
          return Center(
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 10 / 7,
                    child: Image.network(state.blog.thumbnail!)),
                SizedBox(height: 40),
                Text(state.blog.title!),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    state.blog.content!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is DetailError) {
          return Center(
            child: Text("Hata"),
          );
        }
        return Center(
          child: Text("Unknown State"),
        );
      }),
    );
  }
}
