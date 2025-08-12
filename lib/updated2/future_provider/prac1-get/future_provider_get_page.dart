import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated2/future_provider/prac1-get/user_provider.dart';

class FutureProviderGetPage extends ConsumerWidget {
  const FutureProviderGetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Get'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(userProvider);

            return data.when(
              skipLoadingOnRefresh: false,
              data: (data) => data.isEmpty
                  ? const Text('No data found!')
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(item.title[0]),
                          ),
                          title: Text(item.title),
                          subtitle: Text(
                            item.body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
              error: (error, stackTrace) => TextButton(
                onPressed: () {
                  ref.invalidate(userProvider);
                },
                child: Text(error.toString()),
              ),
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(userProvider);
        },
        child: const Icon(
          Icons.refresh_rounded,
        ),
      ),
    );
  }
}
