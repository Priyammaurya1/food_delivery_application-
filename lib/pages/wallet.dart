import 'dart:convert';
import 'package:deliveryapp/services/database.dart';
import 'package:deliveryapp/services/shared_pref.dart';
import 'package:deliveryapp/widgets/app_constant.dart';
import 'package:deliveryapp/widgets/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  TextEditingController amountController = TextEditingController();

  getthesharedpref() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 30),
            _buildWalletCard(),
            const SizedBox(height: 20),
            _buildAddMoneySection(),
            const SizedBox(height: 10),
            _buildAmountButtons(),
            const SizedBox(height: 45),
            _buildAddMoneyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Material(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text('Wallet', style: AppWidget.headlineTextFeildStyle()),
        ),
      ),
    );
  }

  Widget _buildWalletCard() {
    return wallet == null
        ? CircularProgressIndicator()
        : Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
          child: Row(
            children: [
              Image.asset(
                'images/wallet.png',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Wallet',
                    style: AppWidget.semiBoldTextFeildStyle(),
                  ),
                  const SizedBox(height: 5),
                  Text('\$' + wallet!, style: AppWidget.boldTextFeildStyle()),
                ],
              ),
            ],
          ),
        );
  }

  Widget _buildAddMoneySection() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text('Add Money', style: AppWidget.boldTextFeildStyle()),
      ),
    );
  }

  Widget _buildAmountButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAmountBox('100'),
        _buildAmountBox('200'),
        _buildAmountBox('500'),
        _buildAmountBox('1000'),
      ],
    );
  }

  Widget _buildAmountBox(String amount) {
    return GestureDetector(
      onTap: () => makePayment(amount),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE9E2E2)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text('\$$amount', style: AppWidget.semiBoldTextFeildStyle()),
      ),
    );
  }

  Widget _buildAddMoneyButton() {
    return GestureDetector(
      onTap: () {
        openEdit();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF008080),
          borderRadius: BorderRadius.circular(9),
        ),
        child: const Center(
          child: Text(
            'Add Money',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Priyam',
        ),
      );

      displayPaymentSheet(amount);
    } catch (e) {
      print('Payment error: $e');
    }
  }

  Future<void> displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      add = int.parse(wallet!) + int.parse(amount);
      await SharedPreferenceHelper().saveUserWallet(add.toString());
      await DataBaseMethods().UpdateUserWallet(id!, add.toString());
      showDialog(
        context: context,
        builder:
            (_) => const AlertDialog(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  Text('Payment Successful'),
                ],
              ),
            ),
      );
      await getthesharedpref();
      paymentIntent = null;
    } on StripeException {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text("Payment Cancelled")),
      );
    } catch (e) {
      print('Payment sheet error: $e');
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(
    String amount,
    String currency,
  ) async {
    try {
      Map<String, dynamic> body = {
        'amount': (int.parse(amount) * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return jsonDecode(response.body);
    } catch (err) {
      print('Error creating payment intent: $err');
      return null;
    }
  }

  Future openEdit() => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          amountController.clear();
                        },
                        child: Icon(Icons.cancel),
                      ),
                      SizedBox(width: 60),
                      Center(
                        child: Text(
                          'Add Money',
                          style: TextStyle(
                            color: Color(0xFF008080),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Amount'),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Amount",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        makePayment(amountController.text);
                        amountController.clear();
                      },
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF008080),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Pay',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
