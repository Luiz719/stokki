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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme
          .scaffoldBackgroundColor, // Usa a cor de fundo do tema (cinza claro/escuro)
      appBar: AppBar(
        title: const Text(
          'Listas de Compras',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent, // AppBar moderna transparente
        titleTextStyle: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final saved = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  const ShoppinglistEditPage(shoppinglistId: null),
            ),
          );
          if (saved == true) {
            _onUpdate(ref);
          }
        },
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.add_rounded),
      ),
      body: shoppinglistList.when(
        data: (list) => _buildShoppinglistList(context, ref, list),
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
          const SizedBox(height: 16),
          Text(
            'Ops! Algo deu errado.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Erro: $error',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );

  Widget _buildShoppinglistList(
    BuildContext context,
    WidgetRef ref,
    List<Shoppinglist> list,
  ) {
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhuma lista por aqui.',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'Crie uma nova lista para começar!',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: list.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final shoppinglist = list[index];
          return _ShoppingListCard(
            shoppinglist: shoppinglist,
            onTap: () async {
              // Navega para os itens da lista
              final saved = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShoppingitemListPage(
                    shoppinglistId: shoppinglist.id!,
                    listTitle: shoppinglist.title,
                  ),
                ),
              );
              // Atualiza se houver retorno (ex: itens modificados alteraram o status da lista)
              if (saved == true) _onUpdate(ref);
            },
            onEdit: () async {
              // Navega para edição da lista (nome, cor, etc)
              final saved = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ShoppinglistEditPage(shoppinglistId: shoppinglist.id),
                ),
              );
              if (saved == true) _onUpdate(ref);
            },
            onDelete: () {
              _showDeleteDialog(context, ref, shoppinglist);
            },
            onToggleStatus: (bool? value) {
              // Lógica para atualizar o status no banco
              // Clona o objeto com o novo status
              final updatedList = shoppinglist.copyWith(
                isCompleted: value ?? false,
              );

              // Chama o método de salvar/atualizar do ViewModel
              ref
                  .read(shoppinglistListViewModelProvider.notifier)
                  .save(updatedList);
            },
          );
        },
      );
    }
  }

  void _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    Shoppinglist shoppinglist,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Lista'),
        content: Text('Tem certeza que deseja apagar "${shoppinglist.title}"?'),
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
              ref
                  .read(shoppinglistListViewModelProvider.notifier)
                  .delete(shoppinglist);
            },
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET DO CARD SEPARADO PARA ORGANIZAÇÃO E DESIGN ---

class _ShoppingListCard extends StatelessWidget {
  final Shoppinglist shoppinglist;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onToggleStatus;

  const _ShoppingListCard({
    required this.shoppinglist,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = shoppinglist.isCompleted;

    return Card(
      elevation: isCompleted
          ? 0
          : 2, // Remove sombra se completado para "apagar" visualmente
      color: isCompleted
          ? theme.colorScheme.surfaceContainerHighest.withOpacity(0.5)
          : theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isCompleted
            ? BorderSide.none
            : BorderSide(
                color: theme.colorScheme.outlineVariant.withOpacity(0.5),
              ),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // 1. Checkbox Customizado
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isCompleted,
                  activeColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: onToggleStatus,
                ),
              ),

              const SizedBox(width: 12),

              // 2. Título e Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoppinglist.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        color: isCompleted
                            ? theme.disabledColor
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    if (isCompleted)
                      Text(
                        'Concluída',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    else
                      Text(
                        'Toque para ver itens',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),

              // 3. Ações (Editar e Deletar)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_rounded),
                    color: Colors.blueAccent,
                    tooltip: 'Editar nome da lista',
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_rounded),
                    color: Colors.redAccent.withOpacity(0.8),
                    tooltip: 'Excluir lista',
                    onPressed: onDelete,
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
