import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppingitem/shoppingitem_edit_page.dart';
import 'package:stokki/shoppingitem/shoppingitem_list_viewmodel.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';

class ShoppingitemListPage extends ConsumerWidget {
  const ShoppingitemListPage({super.key});

  void _onUpdate(WidgetRef ref) {
    ref.invalidate(shoppingitemListViewModelProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingitemList = ref.watch(shoppingitemListViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoppingitem List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final saved = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ShoppingitemEditPage(
                shoppingitemId: null,
              ),
            ),
          );
          if (saved == true) {
            _onUpdate(ref);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: shoppingitemList.when(
          data: (list) => _buildShoppingitemList(ref, list),
          error: _buildError,
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget? _buildError(error, stackTrace) => Center(
        child: Column(
          children: [
            Text('Error: $error'),
            Text('Stack trace: $stackTrace'),
          ],
        ),
      );

  Widget? _buildShoppingitemList(WidgetRef ref, List<Shoppingitem> list) {
    if (list.isEmpty) {
      return const Center(
        child: Text('No shoppingitems found'),
      );
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Shoppingitem shoppingitem = list[index];
          return ListTile(
            title: Text(shoppingitem.title),
            subtitle: Text(shoppingitem.isCompleted ? 'Completed' : 'Not completed'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // create dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Shoppingitem'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ref
                              .read(shoppingitemListViewModelProvider.notifier)
                              .delete(shoppingitem);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            ),
            onTap: () async {
              final saved = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShoppingitemEditPage(shoppingitemId: shoppingitem.id),
                ),
              );
              if (saved == true) {
                _onUpdate(ref);
              }
            },
          );
        },
      );
    }
  }
}
