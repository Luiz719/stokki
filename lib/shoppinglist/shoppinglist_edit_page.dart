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
  get isNewShoppinglist => widget.shoppinglistId == null;
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

    if (shoppinglist == null && shoppinglistAsync.hasValue) {
      shoppinglist = shoppinglistAsync.value!.copyWith();
      _titleController.text = shoppinglist!.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${isNewShoppinglist ? "New" : "Edit"} Shoppinglist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: shoppinglistAsync.when(
          data: (originalShoppinglist) => _buildForm(context),
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
                labelText: 'Shoppinglist title',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                shoppinglist = shoppinglist!.copyWith(title: value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            CheckboxListTile(
              title: const Text('Is completed'),
              value: shoppinglist!.isCompleted,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  shoppinglist = shoppinglist!.copyWith(isCompleted: value!);
                });
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
          child: Text(isNewShoppinglist ? 'Create' : 'Save'),
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
        ref.read(shoppinglistEditViewModelProvider(widget.shoppinglistId).notifier);
    await notifier.updateState(shoppinglist!);
    await notifier.save();
    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
