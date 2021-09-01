import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:stripe_app/src/bloc/pay/pay_bloc.dart';

import 'package:stripe_app/src/data/cards.dart';
import 'package:stripe_app/src/helpers/helpers.dart';
import 'package:stripe_app/src/pages/card_page.dart';

import 'package:stripe_app/src/services/stripe_service.dart';

import 'package:stripe_app/src/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  final stripeService = StripeService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // ignore:close_sinks
    final payBloc = context.watch<PayBloc>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final response = await stripeService.pagarConNuevaTarjeta(
                  amount: payBloc.state.amout,
                  currency: payBloc.state.currency);
              if (response.ok)
                showAlert(context, 'Pago exitoso', 'Pago realizado con exito');
              else
                showAlert(context, 'Error pago', response.msg);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200.0,
            width: size.width,
            height: size.height,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              physics: const BouncingScrollPhysics(),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return GestureDetector(
                  child: Hero(
                    tag: card.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: card.cardNumber,
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                    ),
                  ),
                  onTap: () {
                    context.read<PayBloc>().add(OnSelectCard(card));
                    Navigator.push(
                      context,
                      navigateFadeIn(
                        context,
                        CardPage(
                          card: card,
                        ),
                      ),
                    );
                  },
                );
              },
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
