import 'package:cubit_dasar/cubit/news_cubit/news_cubit.dart';
import 'package:cubit_dasar/cubit/news_cubit/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNewsData(),
      child: const _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Screen')),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.newsData.articles?.isEmpty ?? true) {
            return const Center(child: Text('Data tidak tersedia.'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: state.newsData.articles?.length ?? 0,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 14.0),
                itemBuilder: (context, index) {
                  final data = state.newsData.articles![index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(data.urlToImage ?? ''),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            data.title ?? 'Tanpa Judul',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: Text(
                            data.description ?? 'Tanpa deskripsi',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
