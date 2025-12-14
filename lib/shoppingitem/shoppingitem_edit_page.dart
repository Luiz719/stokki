import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';
import 'package:stokki/shoppingitem/shoppingitem_edit_viewmodel.dart';

class ShoppingitemEditPage extends ConsumerStatefulWidget {
  final int? shoppingitemId;
  final int listId;

  const ShoppingitemEditPage({
    super.key,
    required this.shoppingitemId,
    required this.listId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingitemEditPageState();
}

class _ShoppingitemEditPageState extends ConsumerState<ShoppingitemEditPage> {
  bool get isNewShoppingitem => widget.shoppingitemId == null;
  Shoppingitem? shoppingitem;
  
  late final TextEditingController _titleController;
  late final TextEditingController _quantityController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _quantityController = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shoppingitemAsync = ref.watch(shoppingitemEditViewModelProvider(widget.shoppingitemId));
    final theme = Theme.of(context);

    if (shoppingitem == null && shoppingitemAsync.hasValue) {
      shoppingitem = shoppingitemAsync.value!.copyWith();
      _titleController.text = shoppingitem!.title;
      _quantityController.text = shoppingitem!.quantity.toString();
    }
    
    String dialogTitle = isNewShoppingitem ? 'Novo Item' : _titleController.text;
    if (dialogTitle.isEmpty) dialogTitle = 'Item sem nome';

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: theme.colorScheme.surface,
      title: Row(
        children: [
          Icon(
            isNewShoppingitem ? Icons.add_shopping_cart : Icons.edit_note,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              dialogTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: shoppingitemAsync.when(
            data: (_) => _buildForm(context),
            error: (error, stack) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Erro: $error', style: const TextStyle(color: Colors.red)),
            ),
            loading: () => const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
      actions: _buildActions(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    final theme = Theme.of(context);
    
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            autofocus: true,
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: 'O que você precisa?',
              hintText: 'Ex: Leite, Pão, Café',
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withAlpha(77),
              prefixIcon: Icon(Icons.shopping_bag_outlined, color: theme.colorScheme.onSurfaceVariant),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                shoppingitem = shoppingitem!.copyWith(title: value);
              });
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o nome do item';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),

          TextFormField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Quantidade',
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withAlpha(77),
              prefixIcon: Icon(Icons.onetwothree, color: theme.colorScheme.onSurfaceVariant),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              final qty = int.tryParse(value);
              if (qty != null) {
                shoppingitem = shoppingitem!.copyWith(quantity: qty);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Informe a qtd';
              if (int.tryParse(value) == null || int.parse(value) <= 0) return 'Inválido';
              return null;
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final theme = Theme.of(context);
    return [
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.onSurface.withAlpha(150),
        ),
        child: const Text('Cancelar'),
      ),
      FilledButton(
        onPressed: () => _save(widget.listId),
        child: Text(isNewShoppingitem ? 'Adicionar' : 'Salvar'),
      ),
    ];
  }

  Future<void> _save(int listId) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final notifier = ref.read(
        shoppingitemEditViewModelProvider(widget.shoppingitemId).notifier
      );
      
      final itemToSave = shoppingitem!.copyWith(listId: listId);
      
      await notifier.updateState(itemToSave);
      await notifier.save(listId);

      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $e')),
        );
      }
    }
  }
}