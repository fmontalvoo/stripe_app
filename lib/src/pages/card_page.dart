import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_app/src/bloc/pay/pay_bloc.dart';

import 'package:stripe_app/src/models/credit_card_custom_model.dart';

import 'package:stripe_app/src/widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  final CreditCardCustomModel card;

  const CardPage({Key key, this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.read<PayBloc>().add(OnDeselectCard());
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: card.cardNumber,
            child: CreditCardWidget(
              cardNumber: card.cardNumber,
              expiryDate: card.expiracyDate,
              cardHolderName: card.cardHolderName,
              cvvCode: card.cvv,
              showBackView: false,
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: TotalPayButton(),
          )
        ],
      ),
    );
  }
}
