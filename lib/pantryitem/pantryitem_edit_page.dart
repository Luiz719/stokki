import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/pantryitem/pantryitem.dart';
import 'package:stokki/pantryitem/pantryitem_edit_viewmodel.dart';

class PantryItemEditPage extends ConsumerStatefulWidget {
  final int? pantryitemId;

  const PantryItemEditPage({super.key, required this.pantryitemId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PantryItemEditPageState();
}

class _PantryItemEditPageState extends ConsumerState<PantryItemEditPage> {
  bool get isNewPantryItem => widget.pantryitemId == null;
  PantryItem? pantryitem;

  late final TextEditingController _titleController;
  late final TextEditingController _quantityController;
  late final TextEditingController _dateController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _quantityController = TextEditingController(text: '1');
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quantityController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _pickDate(BuildContext context) async {
    final initialDate = pantryitem?.expirationDate ?? DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
    );

    if (newDate != null) {
      setState(() {
        pantryitem = pantryitem!.copyWith(expirationDate: newDate);
        _dateController.text = _formatDate(newDate);
      });
    }
  }

  void _clearDate() {
    setState(() {
      pantryitem = PantryItem(
        id: pantryitem!.id,
        title: pantryitem!.title,
        quantity: pantryitem!.quantity,
        expirationDate: null,
      );
      _dateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pantryitemAsync = ref.watch(
      pantryItemEditViewModelProvider(widget.pantryitemId),
    );
    final theme = Theme.of(context);

    if (pantryitem == null && pantryitemAsync.hasValue) {
      pantryitem = pantryitemAsync.value!.copyWith();
      _titleController.text = pantryitem!.title;
      _quantityController.text = pantryitem!.quantity.toString();
      _dateController.text = _formatDate(pantryitem!.expirationDate);
    }

    String dialogTitle = isNewPantryItem ? 'Novo Item' : _titleController.text;
    if (dialogTitle.isEmpty) dialogTitle = 'Item da Despensa';

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: theme.colorScheme.surface,
      title: Row(
        children: [
          Icon(Icons.inventory_2_outlined, color: theme.colorScheme.primary),
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
          child: pantryitemAsync.when(
            data: (_) => _buildForm(context),
            error: (error, stack) =>
                Text('Erro: $error', style: const TextStyle(color: Colors.red)),
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
          // 1. Campo Nome
          TextFormField(
            autofocus: true,
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: 'Nome do produto',
              hintText: 'Ex: Arroz, Feijão',
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withAlpha(
                77,
              ),
              prefixIcon: Icon(
                Icons.label_outline,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                pantryitem = pantryitem!.copyWith(title: value);
              });
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o nome';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // 2. Linha com Quantidade e Data
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coluna Quantidade
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Qtd',
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainerHighest
                        .withAlpha(77),
                    prefixIcon: Icon(
                      Icons.numbers,
                      size: 18,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    final qty = int.tryParse(value);
                    if (qty != null) {
                      pantryitem = pantryitem!.copyWith(quantity: qty);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) return '??';
                    if (int.tryParse(value) == null || int.parse(value) < 0) {
                      return 'Inválido';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(width: 12),

              // Coluna Data de Validade
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: _dateController,
                  readOnly:
                      true, // Impede digitar texto livre, força usar o picker
                  onTap: () => _pickDate(context),
                  decoration: InputDecoration(
                    labelText: 'Validade',
                    hintText: 'Opcional',
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainerHighest
                        .withAlpha(77),
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    // Botão para limpar a data se houver uma selecionada
                    suffixIcon: pantryitem?.expirationDate != null
                        ? IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            onPressed: _clearDate,
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
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
        onPressed: _save,
        child: Text(isNewPantryItem ? 'Adicionar' : 'Salvar'),
      ),
    ];
  }

  void _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final qty = int.tryParse(_quantityController.text) ?? 1;
    pantryitem = pantryitem!.copyWith(quantity: qty);

    final notifier = ref.read(
      pantryItemEditViewModelProvider(widget.pantryitemId).notifier,
    );

    await notifier.updateState(pantryitem!);
    await notifier.save();

    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
