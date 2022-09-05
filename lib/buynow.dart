import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class buynow extends StatefulWidget {
  const buynow({Key? key}) : super(key: key);

  @override
  State<buynow> createState() => _buynowState();
}

class _buynowState extends State<buynow> {
  String name = "Samsung Galaxy M33 5G";
  String imageurl =
      "https://m.media-amazon.com/images/I/81xvGbBFNhL._SX679_.jpg";
  String details =
  """Samsung Galaxy M33 5G (Deep Ocean Blue, 6GB, 128GB Storage) | 6000mAh Battery | Upto 12GB RAM with RAM Plus | Travel Adapter to be Purchased Separately""";
  int price = 18999;
  late Razorpay _razorpay;


  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Image.network(imageurl)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${price}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(details),
              ),
              ElevatedButton(onPressed: () {
                openCheckout();
              }, child: Text("Buy Now"))
            ],
          )),
    );
  }
  void openCheckout() async {
    int netamount = price *100;
    var options = {
      'key': 'rzp_test_VtMBf0AiM2IX5c',
      'amount': netamount,
      'name': name,
      'description': details,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: ${response.orderId} ${response.paymentId}');
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: ${response.message}');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

}
