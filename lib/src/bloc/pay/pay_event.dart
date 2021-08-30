part of 'pay_bloc.dart';

@immutable
abstract class PayEvent {}

class OnSelectCard extends PayEvent {
  OnSelectCard(this.selectedCard);
  final CreditCardCustomModel selectedCard;
}

class OnDeselectCard extends PayEvent {}
