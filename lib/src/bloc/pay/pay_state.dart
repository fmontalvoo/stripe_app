part of 'pay_bloc.dart';

@immutable
abstract class PayState {}

class PaymenState extends PayState {
  PaymenState({
    this.total = 0.0,
    this.currency = 'USD',
    this.activeCard = false,
    this.card,
  });
  final double total;
  final String currency;
  final bool activeCard;
  final CreditCardCustomModel card;

  PaymenState copyWith({
    double total,
    String currency,
    bool activeCard,
    CreditCardCustomModel card,
  }) =>
      PaymenState(
        total: total ?? this.total,
        currency: currency ?? this.currency,
        activeCard: activeCard ?? this.activeCard,
        card: card ?? this.card,
      );
}
