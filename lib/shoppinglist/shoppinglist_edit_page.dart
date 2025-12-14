import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppinglist/shoppinglist.dart';
import 'package:stokki/shoppinglist/shoppinglist_edit_viewmodel.dart';

class ShoppinglistEditPage extends ConsumerStatefulWidget {
  final int? shoppinglistId;
  const ShoppinglistEditPage({super.key, required this.shoppinglistId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppinglistEditPageState();
}

class _ShoppinglistEditPageState extends ConsumerState<ShoppinglistEditPage> {
  bool get isNewShoppinglist => widget.shoppinglistId == null;
  Shoppinglist? shoppinglist;
  late final TextEditingController _titleController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shoppinglistAsync = ref.watch(shoppinglistEditViewModelProvider(widget.shoppinglistId));

    // Inicializa os dados quando carregado
    if (shoppinglist == null && shoppinglistAsync.hasValue) {
      // Cria uma cópia local para edição para não alterar o estado global antes de salvar
      shoppinglist = shoppinglistAsync.value!.copyWith();
      _titleController.text = shoppinglist!.title;
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      title: Text(
        isNewShoppinglist ? 'Nova Lista' : 'Editar Lista',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: shoppinglistAsync.when(
          data: (originalShoppinglist) => _buildForm(context),
          error: (error, stackTrace) => _buildErrorState(error),
          loading: () => const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSurface.withAlpha(150), // Uso do withAlpha
          ),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _save,
          child: Text(isNewShoppinglist ? 'Criar' : 'Salvar'),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    final theme = Theme.of(context);
    
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dê um nome para sua lista de compras.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withAlpha(180), 
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            autofocus: true,
            controller: _titleController,
            style: const TextStyle(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              labelText: 'Nome da lista',
              hintText: 'Ex: Festinha da Família',
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withAlpha(77), 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              prefixIcon: Icon(
                Icons.edit_note_rounded, 
                color: theme.colorScheme.primary.withAlpha(200)
              ),
            ),
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {
              if (shoppinglist != null) {
                shoppinglist = shoppinglist!.copyWith(title: value);
              }
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'O nome não pode ficar vazio';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 32),
          const SizedBox(height: 8),
          Text('Erro ao carregar: $error', textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Future<void> _save() async {
    if (shoppinglist == null) return;
    
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final notifier = ref.read(
        shoppinglistEditViewModelProvider(widget.shoppinglistId).notifier
      );
      
      await notifier.updateState(shoppinglist!);
      await notifier.save();

      if (mounted) {
        Navigator.of(context).pop(true); // Retorna true indicando sucesso
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar: $e')),
        );
      }
    }
  }
}