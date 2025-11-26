import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppingitem/shoppingitem_list_page.dart';
import 'package:stokki/shoppinglist/shoppinglist_edit_page.dart';
import 'package:stokki/shoppinglist/shoppinglist_list_viewmodel.dart';
import 'package:stokki/shoppinglist/shoppinglist.dart';

class ShoppinglistListPage extends ConsumerWidget {
  const ShoppinglistListPage({super.key});

  void _onUpdate(WidgetRef ref) {
    ref.invalidate(shoppinglistListViewModelProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppinglistList = ref.watch(shoppinglistListViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas de Compras'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final saved = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShoppinglistEditPage(
                shoppinglistId: null
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
        child: shoppinglistList.when(
          data: (list) => _buildShoppinglistList(ref, list),
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

  Widget? _buildShoppinglistList(WidgetRef ref, List<Shoppinglist> list) {
    if (list.isEmpty) {
      return const Center(
        child: Text('Não há listas de compras.'),
      );
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Shoppinglist shoppinglist = list[index];
          return ListTile(
            title: Text(shoppinglist.title),
            subtitle: Text(shoppinglist.isCompleted ? 'Concluída' : 'Não concluída'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // create dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir Lista de Compras'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ref
                              .read(shoppinglistListViewModelProvider.notifier)
                              .delete(shoppinglist);
                        },
                        child: const Text('Apagar'),
                      ),
                    ],
                  ),
                );
              },
            ),
            onTap: () async {
              final saved = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShoppingitemListPage(shoppinglistId: shoppinglist.id!),
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
