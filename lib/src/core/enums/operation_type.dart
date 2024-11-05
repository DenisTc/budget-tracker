enum OperationTypeEnum {
  income(value: 0),
  expense(value: 1);

  const OperationTypeEnum({required this.value});

  final int value;
}
