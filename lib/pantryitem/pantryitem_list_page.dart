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
    final pantryitemListAsync = ref.watch(pantryItemListViewModelProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Minha Despensa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final saved = await showDialog(
            context: context,
            builder: (context) => const PantryItemEditPage(pantryitemId: null),
          );
          if (saved == true) {
            _onUpdate(ref);
          }
        },
        label: const Text('Novo Item'),
        icon: const Icon(Icons.add_box_rounded),
      ),
      body: pantryitemListAsync.when(
        data: (list) => _buildPantryGrid(context, ref, list),
        error: _buildError,
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildError(error, stackTrace) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
        const SizedBox(height: 16),
        Text('Erro: $error'),
      ],
    ),
  );

  Widget _buildPantryGrid(
    BuildContext context,
    WidgetRef ref,
    List<PantryItem> list,
  ) {
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.kitchen_outlined, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'Sua despensa está vazia.',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    // Grid Layout
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, 
        childAspectRatio: 1.70, 
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return _PantryItemCard(
          item: item,
          onTap: () async {
            final saved = await showDialog(
              context: context,
              builder: (context) => PantryItemEditPage(pantryitemId: item.id),
            );
            if (saved == true) _onUpdate(ref);
          },
          onIncrement: () {
            final updatedItem = item.copyWith(quantity: item.quantity + 1);
            ref
                .read(pantryItemListViewModelProvider.notifier)
                .save(updatedItem);
          },
          onDecrement: () {
            if (item.quantity > 1) {
              final updatedItem = item.copyWith(quantity: item.quantity - 1);
              ref
                  .read(pantryItemListViewModelProvider.notifier)
                  .save(updatedItem);
            } else {
              _showDeleteDialog(context, ref, item);
            }
          },
          onDelete: () => _showDeleteDialog(context, ref, item),
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, PantryItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remover da Despensa'),
        content: Text('Deseja remover "${item.title}"?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(pantryItemListViewModelProvider.notifier).delete(item);
            },
            child: const Text('Remover'),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET DO CARD EM GRADE ---

class _PantryItemCard extends StatelessWidget {
  final PantryItem item;
  final VoidCallback onTap;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const _PantryItemCard({
    required this.item,
    required this.onTap,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasExpiration = item.expirationDate != null;

    final isExpired =
        hasExpiration && item.expirationDate!.isBefore(DateTime.now());

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip
          .antiAlias, 
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Título e Ícone de Delete
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: onDelete,
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        size: 20,
                        color: theme.colorScheme.error.withAlpha(150),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // 2. Data de Validade (Se houver)
              if (hasExpiration) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isExpired
                        ? Colors.redAccent.withAlpha(30)
                        : theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 12,
                        color: isExpired
                            ? Colors.red
                            : theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(item.expirationDate!),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isExpired
                              ? Colors.red
                              : theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
              ],

              // 3. Controles de Quantidade
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withAlpha(
                    100,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _SmallIconButton(
                      icon: Icons.remove,
                      onTap: onDecrement,
                      color: item.quantity == 1
                          ? Colors.redAccent
                          : theme.colorScheme.primary,
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _SmallIconButton(
                      icon: Icons.add,
                      onTap: onIncrement,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const _SmallIconButton({
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Touch target maior
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}
