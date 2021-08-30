import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/src/bloc/pay/pay_bloc.dart';

import 'package:stripe_app/src/pages/home_page.dart';
import 'package:stripe_app/src/pages/complete_payment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PayBloc()),
      ],
      child: MaterialApp(
        title: 'Stripe App',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'complete_payment': (context) => CompletePaymentPage(),
        },
        theme: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF284879),
            scaffoldBackgroundColor: const Color(0xFF21232A)),
      ),
    );
  }
}
