import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/src/bloc/pay/pay_bloc.dart';

class TotalPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 100.0,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '25 USD',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          BlocBuilder<PayBloc, PayState>(
            builder: (context, state) => _BtnPay(
              cardActive: (state as PaymenState).activeCard,
            ),
          )
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  const _BtnPay({
    Key key,
    this.cardActive = false,
  }) : super(key: key);
  final bool cardActive;

  @override
  Widget build(BuildContext context) {
    return cardActive
        ? buttonCardPay(context)
        : buttonAppleAndGooglePay(context);
  }

  Widget buttonAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      height: 45.0,
      elevation: 0.0,
      minWidth: 150.0,
      color: Colors.black,
      shape: StadiumBorder(),
      child: Row(
        children: [
          Icon(
            Platform.isAndroid
                ? FontAwesomeIcons.google
                : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          SizedBox(width: 5.0),
          Text(
            'Pay',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }

  Widget buttonCardPay(BuildContext context) {
    return MaterialButton(
      height: 45.0,
      elevation: 0.0,
      minWidth: 150.0,
      color: Colors.black,
      shape: StadiumBorder(),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.creditCard,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            'Pay',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }
}
