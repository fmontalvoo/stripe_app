part of 'pay_bloc.dart';

// @immutable
// abstract class PayState {}

class PayState {
  PayState({
    this.total = 0.0,
    this.currency = 'USD',
    this.activeCard = false,
    this.card,
  });
  final double total;
  final String currency;
  final bool activeCard;
  final CreditCardCustomModel card;

  String get amout => total.toStringAsFixed(2);

  PayState copyWith({
    double total,
    String currency,
    bool activeCard,
    CreditCardCustomModel card,
  }) =>
      PayState(
        total: total ?? this.total,
        currency: currency ?? this.currency,
        activeCard: activeCard ?? this.activeCard,
        card: card ?? this.card,
      );
}
