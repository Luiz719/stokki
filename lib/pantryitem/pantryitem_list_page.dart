import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/pantryitem/pantryitem_edit_page.dart';
import 'package:stokki/pantryitem/pantryitem_list_viewmodel.dart';
import 'package:stokki/pantryitem/pantryitem.dart';

class PantryItemListPage extends ConsumerWidget {
  const PantryItemListPage({super.key});

  void _onUpdate(WidgetRef ref) {
    ref.invalidate(pantryItemListViewModelProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pantryitemList = ref.watch(pantryItemListViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PantryItem List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final saved = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PantryItemEditPage(
                pantryitemId: null,
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
        child: pantryitemList.when(
          data: (list) => _buildPantryItemList(ref, list),
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

  Widget? _buildPantryItemList(WidgetRef ref, List<PantryItem> list) {
    if (list.isEmpty) {
      return const Center(
        child: Text('No pantryitems found'),
      );
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          PantryItem pantryitem = list[index];
          return ListTile(
            title: Text(pantryitem.title),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // create dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete PantryItem'),
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
                              .read(pantryItemListViewModelProvider.notifier)
                              .delete(pantryitem);
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
                  builder: (context) => PantryItemEditPage(pantryitemId: pantryitem.id),
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
