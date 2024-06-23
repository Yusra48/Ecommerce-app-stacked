import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/PaymentSuccessfulpage.dart';

class ConfirmCheckoutPage extends StatelessWidget {
  final String? orderAmount;
  final String? convenienceFee;

  ConfirmCheckoutPage({
    this.orderAmount,
    this.convenienceFee,
  });

  @override
  Widget build(BuildContext context) {
    double orderAmountValue = double.tryParse(orderAmount ?? '0.0') ?? 0.0;
    double convenienceFeeValue =
        double.tryParse(convenienceFee ?? '0.0') ?? 0.0;
    double totalAmount = orderAmountValue + convenienceFeeValue;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Confirm Checkout',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Order'),
              trailing: Text('₹ ${orderAmountValue.toStringAsFixed(2)}'),
            ),
            ListTile(
              title: Text('Shipping'),
              trailing: Text('₹ ${convenienceFeeValue.toStringAsFixed(2)}'),
            ),
            Divider(),
            ListTile(
              title: Text('Total'),
              trailing: Text('₹ ${totalAmount.toStringAsFixed(2)}'),
            ),
            Spacer(),
            SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessPage(),
                    ),
                  );
                },
                child: Text(
                  'Confirm Checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
