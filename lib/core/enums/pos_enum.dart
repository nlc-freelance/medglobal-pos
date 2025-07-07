enum ReasonForRefund {
  DAMAGED_ITEMS('Damaged Items'),
  DISSATISFIED('Dissatisfied'),
  INCORRECT_ITEM('Incorrect Item'),
  INCORRECT_VARIANT('Incorrect Variant'),
  OTHER('Other');

  final String label;
  const ReasonForRefund(this.label);
}

enum DiscountCategory {
  SENIOR_DISCOUNT('Senior Discount (20%)', 20),
  SOLO_PARENT_DISCOUNT('Solo Parent Discount (20%)', 20),
  PWD_DISCOUNT('PWD (20%)', 20),
  GENERIC_DISCOUNT('Generic Discount (3%)', 3);

  final String label;
  final double value;
  const DiscountCategory(this.label, this.value);
}

enum DiscountType { PESO, PERCENT }
