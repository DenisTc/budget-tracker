import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/core/theme/app_theme.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/cubit/transaction_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/enums/category_action.dart';
import 'package:budget_tracker/src/core/extension/string_extension.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/presentation/cubit/category_cubit.dart';
import 'package:budget_tracker/src/feature/category_list/presentation/cubit/category_list_cubit.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/widgets/add_category_form.dart';

class CategoryControllerProvider extends InheritedWidget {
  final ValueNotifier<CategoryModel?> categoryController;

  const CategoryControllerProvider({
    super.key,
    required this.categoryController,
    required super.child,
  });

  static CategoryControllerProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CategoryControllerProvider>();
  }

  @override
  bool updateShouldNotify(CategoryControllerProvider oldWidget) {
    return oldWidget.categoryController != categoryController;
  }
}

class CategoryOfTransaction extends StatefulWidget {
  const CategoryOfTransaction({super.key});

  @override
  State<CategoryOfTransaction> createState() => _CategoryOfTransactionState();
}

class _CategoryOfTransactionState extends State<CategoryOfTransaction> {
  ValueNotifier<CategoryModel?>? categoryController;
  @override
  void initState() {
    super.initState();
    context.read<CategoryListCubit>().getCategories();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    categoryController =
        CategoryControllerProvider.of(context)?.categoryController;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoryListLoadSuccess) {
          if (state.categories.isEmpty) {
            return ValueListenableBuilder<CategoryModel?>(
              valueListenable: categoryController!,
              builder: (context, selectedCategory, child) {
                return TextFormField(
                  controller: TextEditingController(
                    text: selectedCategory?.title,
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
              },
            );
          } else {
            return TextFormField(
              controller: TextEditingController(
                text: categoryController?.value?.title,
              ),
              readOnly: true,
              keyboardType: TextInputType.datetime,
              onTap: () {
                FocusScope.of(context).focusedChild?.unfocus();
                if (categoryController != null) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => CategoryControllerProvider(
                      categoryController: categoryController!,
                      child: const CategoryBottomSheet(),
                    ),
                  );
                }
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
          }
        } else {
          return Text(S.of(context).categoryLoadingError);
        }
      },
    );
  }
}

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  late final CategoryCubit categoryCubit;
  late final CategoryListCubit categoryListCubit;
  late final TransactionListCubit transactionsCubit;

  @override
  void initState() {
    super.initState();
    categoryCubit = context.read<CategoryCubit>();
    categoryListCubit = context.read<CategoryListCubit>();
    transactionsCubit = context.read<TransactionListCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryRemoveSuccess) {
          categoryListCubit.getCategories();
          transactionsCubit.getTransactions();
        }
        if (state is CategoryUpdateSuccess) {
          categoryListCubit.getCategories();
          transactionsCubit.getTransactions();
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _AddNewCategoryButton(),
            AppSizes.gapH8,
            const _CategoryList(),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatefulWidget {
  const _CategoryList();

  @override
  State<_CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<_CategoryList> {
  late final CategoryCubit categoryCubit;
  ValueNotifier<CategoryModel?>? categoryController;

  @override
  void initState() {
    super.initState();
    categoryCubit = context.read<CategoryCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    categoryController =
        CategoryControllerProvider.of(context)?.categoryController;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoryListLoadSuccess) {
          if (state.categories.isEmpty) {
            return const SizedBox.shrink();
          }

          return SingleChildScrollView(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.categories.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final category = state.categories[index];

                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          categoryController?.value = category;
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            AbsorbPointer(
                              child: Radio<CategoryModel>(
                                value: category,
                                groupValue: categoryController?.value,
                                activeColor: AppTheme.urobilin,
                                onChanged: (_) {},
                              ),
                            ),
                            AppSizes.gapW8,
                            Expanded(
                              child: Text(category.title),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuButton<CategoryActionEnum>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (CategoryActionEnum result) {
                        if (result == CategoryActionEnum.edit) {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => EditCategoryForm(category),
                          );
                        } else {
                          categoryCubit.removeCategory(category.id);
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<CategoryActionEnum>(
                          value: CategoryActionEnum.edit,
                          child: Text(S.of(context).edit),
                        ),
                        PopupMenuItem<CategoryActionEnum>(
                          value: CategoryActionEnum.remove,
                          child: Text(S.of(context).delete),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _AddNewCategoryButton extends StatelessWidget {
  const _AddNewCategoryButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          builder: (_) => const AddCategoryForm(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            AppSizes.gapW16,
            Expanded(
              child: Text(S.of(context).addCategory),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class EditCategoryForm extends StatefulWidget {
  final CategoryModel category;

  const EditCategoryForm(
    this.category, {
    super.key,
  });

  @override
  State<EditCategoryForm> createState() => _EditCategoryFormState();
}

class _EditCategoryFormState extends State<EditCategoryForm> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.category.title);
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Название категории',
                ),
                validator: (value) {
                  if (value.isNullOrEmpty) {
                    return 'Укажите новое название категории';
                  }
                  return null;
                },
              ),
              AppSizes.gapH16,
              SizedBox(
                width: double.infinity,
                child: BlocListener<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    if (state is CategoryAddSuccess) {
                      context.read<CategoryListCubit>().getCategories();
                      Navigator.pop(context);
                    } else if (state is CategoryError) {
                      final message = state.error.name ==
                              CategoryErrorEnum.isExist.name
                          ? 'Категория с таким именем уже существует'
                          : 'Не удалось добавить категорию, попробуйте позже';
                      showErorDialog(context, message: message);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final category = CategoryModel(
                          id: widget.category.id,
                          title: titleController.text.trim(),
                        );

                        context.read<CategoryCubit>().updateCategory(category);
                      }
                    },
                    child: const Text('Обновить'),
                  ),
                ),
              ),
              AppSizes.gapH16,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showErorDialog(BuildContext context, {required String message}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Ок'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
