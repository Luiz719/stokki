import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';
import 'package:stokki/shoppingitem/shoppingitem_edit_viewmodel.dart';

class ShoppingitemEditPage extends ConsumerStatefulWidget {
  final int? shoppingitemId;
  const ShoppingitemEditPage({super.key, required this.shoppingitemId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingitemEditPageState();
}

class _ShoppingitemEditPageState extends ConsumerState<ShoppingitemEditPage> {
  get isNewShoppingitem => widget.shoppingitemId == null;
  Shoppingitem? shoppingitem;
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
    final shoppingitemAsync = ref.watch(shoppingitemEditViewModelProvider(widget.shoppingitemId));

    if (shoppingitem == null && shoppingitemAsync.hasValue) {
      shoppingitem = shoppingitemAsync.value!.copyWith();
      _titleController.text = shoppingitem!.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${isNewShoppingitem ? "New" : "Edit"} Shoppingitem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: shoppingitemAsync.when(
          data: (originalShoppingitem) => _buildForm(context),
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
                labelText: 'Shoppingitem title',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                shoppingitem = shoppingitem!.copyWith(title: value);
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
              value: shoppingitem!.isCompleted,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  shoppingitem = shoppingitem!.copyWith(isCompleted: value!);
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
          child: Text(isNewShoppingitem ? 'Create' : 'Save'),
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
        ref.read(shoppingitemEditViewModelProvider(widget.shoppingitemId).notifier);
    await notifier.updateState(shoppingitem!);
    await notifier.save();
    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
