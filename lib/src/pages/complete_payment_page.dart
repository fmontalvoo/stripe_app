import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompletePaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.star,
              size: 100.0,
              color: Colors.white54,
            ),
            SizedBox(height: 20.0),
            Text(
              'Pago completo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
