import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'package:stripe_app/src/models/credit_card_custom_model.dart';

part 'pay_event.dart';
part 'pay_state.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  PayBloc() : super(PayState());

  @override
  Stream<PayState> mapEventToState(PayEvent event) async* {
    if (event is OnSelectCard)
      yield state.copyWith(activeCard: true, card: event.selectedCard);
    if (event is OnDeselectCard)
      yield state.copyWith(activeCard: false, card: null);
  }
}
