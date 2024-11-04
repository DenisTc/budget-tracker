import 'package:budget_tracker/src/core/enums/operation_type_enum.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/core/theme/app_theme.dart';
import 'package:budget_tracker/src/feature/category_list/presentation/cubit/category_list_cubit.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/cubit/transaction_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FilterTransactionListScreen extends StatefulWidget {
  const FilterTransactionListScreen({super.key});

  @override
  State<FilterTransactionListScreen> createState() =>
      _FilterTransactionListScreenState();
}

class _FilterTransactionListScreenState
    extends State<FilterTransactionListScreen> {
  late final TransactionListCubit cubit;
  String? _selectedDateRangeString;
  DateTimeRange? _selectedDateRange;
  int? _selectedCategoryId;
  int? _selectedType;

  @override
  void initState() {
    super.initState();
    context.read<CategoryListCubit>().getCategories();
    cubit = context.read<TransactionListCubit>();
    _selectedDateRange = cubit.selectedDateRange;
    _selectedCategoryId = cubit.selectedCategoryId;
    _selectedType = cubit.selectedType;
  }

  void selectCategory(int id) {
    setState(() {
      _selectedCategoryId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтр транзакций'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Выберите тип транзакции:'),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<int?>(
                            value: OperationTypeEnum.income.value,
                            groupValue: _selectedType,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedType = value;
                              });
                            },
                          ),
                          const SizedBox(width: 0),
                          const Text('Доход')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<int?>(
                            value: OperationTypeEnum.expense.value,
                            groupValue: _selectedType,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedType = value;
                              });
                            },
                          ),
                          const SizedBox(width: 0),
                          const Text('Расход')
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
                const SizedBox(height: 8.0),
                const Text('Выберите категорию:'),
                const SizedBox(height: 16.0),
                BlocBuilder<CategoryListCubit, CategoryListState>(
                  builder: (context, state) {
                    if (state is CategoryListLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is CategoryListLoadSuccess) {
                      if (state.categories.isEmpty) {
                        return const Text('Добавьте категорию');
                      } else {
                        return Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            ...state.categories.map(
                              (category) => CategoryTag(
                                title: category.title,
                                isSelected: category.id == _selectedCategoryId,
                                onTap: () {
                                  selectCategory(category.id);
                                },
                              ),
                            )
                          ],
                        );
                      }
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${S.of(context).period}:'),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        _selectedDateRange = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          builder: (context, child) {
                            return child!;
                          },
                        );

                        if (_selectedDateRange != null) {
                          setState(() {
                            _selectedDateRangeString =
                                '${DateFormat('dd-MM-yyyy').format(_selectedDateRange!.start)} - ${DateFormat('dd-MM-yyyy').format(_selectedDateRange!.end)}';
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(_selectedDateRangeString ??
                            S.of(context).enterDate),
                      ),
                    ),
                    const Spacer(),
                    if (_selectedDateRangeString != null)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedDateRange = null;
                            _selectedDateRangeString = null;
                          });
                        },
                        child: Text(S.of(context).clear),
                      )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<TransactionListCubit>().getTransactions();
                  Navigator.pop(context);
                },
                child: Text(S.of(context).clearFilters),
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<TransactionListCubit>().getTransactions(
                        startDate: _selectedDateRange?.start,
                        endDate: _selectedDateRange?.end,
                        categoryId: _selectedCategoryId,
                        type: _selectedType,
                      );
                  Navigator.pop(context);
                },
                child: Text(S.of(context).accept),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTag extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTag({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.urobilin : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
