import 'package:meta/meta.dart';
import 'package:stripe_app/src/models/stripe_response_model.dart';

import 'package:stripe_payment/stripe_payment.dart';

import 'package:stripe_app/src/environments/environment_dev.dart';

class StripeService {
  static final _instance = StripeService._();

  String _apiKey = environment['api_key'];
  String _secretKey = environment['secret_key'];
  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';

  StripeService._() {
    StripePayment.setOptions(StripeOptions(
      publishableKey: _apiKey,
      androidPayMode: 'test',
      merchantId: 'test',
    ));
  }
  factory StripeService() => _instance;

  Future _crearPaymentIntent(String amount, String currency) async {}

  Future _realizarPago(
    String amount,
    String currency,
    PaymentMethod method,
  ) async {}

  Future pagarConTarjetaExistente({
    @required String amount,
    @required String currency,
    @required CreditCard card,
  }) async {}

  Future<StripeResponse> pagarConNuevaTarjeta({
    @required String amount,
    @required String currency,
  }) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());

      return StripeResponse(ok: true);
    } catch (e) {
      return StripeResponse(msg: e.toString());
    }
  }

  Future pagarConGooglePayApplePay({
    @required String amount,
    @required String currency,
  }) async {}
}
