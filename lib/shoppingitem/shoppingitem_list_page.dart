import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppingitem/shoppingitem_edit_page.dart';
import 'package:stokki/shoppingitem/shoppingitem_list_viewmodel.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';

class ShoppingitemListPage extends ConsumerWidget {
  final int shoppinglistId;
  final String listTitle;

  const ShoppingitemListPage({
    super.key, 
    required this.shoppinglistId, 
    required this.listTitle
  });

  void _onUpdate(WidgetRef ref) {
    ref.invalidate(shoppingitemListViewModelProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingitemListAsync = ref.watch(shoppingitemListViewModelProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(listTitle),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.onSurface, 
          fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final saved = await showDialog(
            context: context,
            builder: (context) => ShoppingitemEditPage(
              shoppingitemId: null,
              listId: shoppinglistId
            ),
          );
          if (saved == true) {
            _onUpdate(ref);
          }
        },
        label: const Text('Novo Item'),
        icon: const Icon(Icons.add_shopping_cart_rounded),
      ),
      body: shoppingitemListAsync.when(
        data: (fullList) {
          // Filtra itens pertencentes apenas a esta lista
          final items = fullList.where((i) => i.listId == shoppinglistId).toList();
          return _buildShoppingitemList(context, ref, items);
        },
        error: _buildError,
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildError(error, stackTrace) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
          Text('Erro: $error'),
        ],
      ),
    ),
  );

  Widget _buildShoppingitemList(BuildContext context, WidgetRef ref, List<Shoppingitem> list) {
if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.remove_shopping_cart_outlined, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'Sua lista está vazia.',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text('Adicione itens usando o botão abaixo.', style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = list[index];
        return _ShoppingItemCard(
          item: item,
          onTap: () async {
            final saved = await showDialog(
              context: context,
              builder: (context) => ShoppingitemEditPage(
                shoppingitemId: item.id, 
                listId: shoppinglistId
              ),
            );
            if (saved == true) _onUpdate(ref);
          },
          onToggle: (val) {
             final updatedItem = item.copyWith(isPurchased: val ?? false);
             ref.read(shoppingitemListViewModelProvider.notifier).save(updatedItem, item.listId!);
          },
          onIncrement: () {
            final updatedItem = item.copyWith(quantity: item.quantity + 1);
            ref.read(shoppingitemListViewModelProvider.notifier).save(updatedItem, item.listId!);
          },
          onDecrement: () {
            if (item.quantity > 1) {
               final updatedItem = item.copyWith(quantity: item.quantity - 1);
               ref.read(shoppingitemListViewModelProvider.notifier).save(updatedItem, item.listId!);
            }
          },
          onDelete: () {
             _showDeleteDialog(context, ref, item);
          },
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, Shoppingitem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Item'),
        content: Text('Tem certeza que deseja apagar "${item.title}"?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(shoppingitemListViewModelProvider.notifier).delete(item);
            },
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
  }
}


class _ShoppingItemCard extends StatelessWidget {
  final Shoppingitem item;
  final VoidCallback onTap;
  final ValueChanged<bool?> onToggle;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const _ShoppingItemCard({
    required this.item,
    required this.onTap,
    required this.onToggle,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPurchased = item.isPurchased;

    return Card(
      elevation: isPurchased ? 0 : 3,
      color: isPurchased 
          ? theme.colorScheme.surfaceContainerHighest.withAlpha(128) 
          : theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isPurchased 
            ? BorderSide.none 
            : BorderSide(color: theme.colorScheme.outlineVariant.withAlpha(100)),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // 1. Checkbox 
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  value: isPurchased,
                  activeColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  onChanged: onToggle,
                ),
              ),
              
              const SizedBox(width: 8),

              // 2. Título e Subtítulo 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: isPurchased ? TextDecoration.lineThrough : null,
                        color: isPurchased ? theme.disabledColor : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isPurchased ? 'Comprado' : 'Não comprado',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isPurchased ? Colors.green : theme.colorScheme.onSurfaceVariant,
                        fontWeight: isPurchased ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              // 3. Controles de Quantidade e Delete
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Só exibe controles se não estiver comprado
                  if (!isPurchased) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest.withAlpha(150),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _QuantityButton(
                            icon: Icons.remove,
                            onTap: onDecrement,
                            isEnabled: item.quantity > 1, 
                            color: theme.colorScheme.primary,
                          ),
                          
                          Container(
                            constraints: const BoxConstraints(minWidth: 24),
                            alignment: Alignment.center,
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          
                          _QuantityButton(
                            icon: Icons.add,
                            onTap: onIncrement,
                            isEnabled: true,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: theme.disabledColor.withAlpha(50))
                      ),
                      child: Text(
                        'Qtd: ${item.quantity}',
                        style: TextStyle(
                          color: theme.disabledColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(width: 8),

                  IconButton(
                    icon: const Icon(Icons.delete_outline_rounded),
                    color: Colors.redAccent.withAlpha(200),
                    onPressed: onDelete,
                    tooltip: 'Excluir item',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(), 
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final bool isEnabled;

  const _QuantityButton({
    required this.icon, 
    required this.onTap, 
    required this.color,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null, 
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon, 
          size: 18, 
          color: isEnabled ? color : color.withAlpha(80), 
        ),
      ),
    );
  }
}