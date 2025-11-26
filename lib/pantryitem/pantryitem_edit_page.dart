import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/pantryitem/pantryitem.dart';
import 'package:stokki/pantryitem/pantryitem_edit_viewmodel.dart';

class PantryItemEditPage extends ConsumerStatefulWidget {
  final int? pantryitemId;
   
  const PantryItemEditPage({super.key, required this.pantryitemId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PantryItemEditPageState();
}

class _PantryItemEditPageState extends ConsumerState<PantryItemEditPage> {
  get isNewPantryItem => widget.pantryitemId == null;
  PantryItem? pantryitem;
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
    final pantryitemAsync = ref.watch(pantryItemEditViewModelProvider(widget.pantryitemId));

    if (pantryitem == null && pantryitemAsync.hasValue) {
      pantryitem = pantryitemAsync.value!.copyWith();
      _titleController.text = pantryitem!.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${isNewPantryItem ? "New" : "Edit"} PantryItem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: pantryitemAsync.when(
          data: (originalPantryItem) => _buildForm(context),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autofocus: true,
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'PantryItem title',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                pantryitem = pantryitem!.copyWith(title: value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),
            _buildButtonBar(ref, context),
          ],
        ),
      ),
    );
  }

  Row _buildButtonBar(WidgetRef ref, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _save,
          child: Text(isNewPantryItem ? 'Create' : 'Save'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel')),
      ],
    );
  }

  void _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final notifier =
        ref.read(pantryItemEditViewModelProvider(widget.pantryitemId).notifier);
    await notifier.updateState(pantryitem!);
    await notifier.save();
    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
