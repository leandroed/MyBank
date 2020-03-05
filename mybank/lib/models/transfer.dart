/// Model for bank transfer.
class Transfer {
  // Monetary value.
  final double value;
  // Bank account number.
  final int accountNumber;

  // Initialize model of transfer.
  Transfer(
    this.value,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
