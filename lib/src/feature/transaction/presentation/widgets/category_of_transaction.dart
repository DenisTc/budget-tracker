import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category_list/presentation/cubit/category_list_cubit.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/add_category_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_tracker/src/core/extension/string_extension.dart';

class CategoryOfTransaction extends StatefulWidget {
  const CategoryOfTransaction({
    super.key,
    required this.categoryController,
  });

  final ValueNotifier<CategoryModel?> categoryController;

  @override
  State<CategoryOfTransaction> createState() => _CategoryOfTransactionState();
}

class _CategoryOfTransactionState extends State<CategoryOfTransaction> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryListCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoryListLoadSuccess) {
          if (state.categories.isEmpty) {
            return TextFormField(
              controller: TextEditingController(
                text: widget.categoryController.value?.title,
              ),
              readOnly: true,
              keyboardType: TextInputType.datetime,
              onTap: () {
                FocusScope.of(context).focusedChild?.unfocus();
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  builder: (_) => const AddCategoryForm(),
                );
              },
              decoration: InputDecoration(
                labelText: S.of(context).transactionCategory,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return S.of(context).pleaseSelectCategory;
                }
                return null;
              },
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<CategoryModel>(
                    value: widget.categoryController.value,
                    hint: Text(S.of(context).category),
                    onChanged: (value) {
                      widget.categoryController.value = value;
                    },
                    items: state.categories.map((CategoryModel category) {
                      return DropdownMenuItem<CategoryModel>(
                        value: category,
                        child: Text(category.title),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return S.of(context).pleaseSelectCategory;
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    builder: (_) => const AddCategoryForm(),
                  ),
                  icon: const Icon(Icons.add),
                ),
              ],
            );
          }
        } else {
          return Text(S.of(context).categoryLoadingError);
        }
      },
    );
  }
}
