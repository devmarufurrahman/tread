import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tread256/features/subscriptions/services/constant_stripe.dart';

class StripeServicePayment {
  StripeServicePayment._();
  static final StripeServicePayment instance = StripeServicePayment._();

  /// Call this in main() before runApp to initialize Stripe
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey = Constantstripe.stripePublishableKey;
  }

  /// Call this to start the payment flow
  Future<void> makePayment({
    required int amount,
    required String currency,
  }) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        amount,
        currency,
      );

      if (paymentIntentClientSecret == null) {
        // print("Failed to create PaymentIntent");
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Tread256",
        ),
      );

      await _processPayment();
    } catch (e) {
      // print("Error in makePayment: $e");
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();

      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };

      final response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer ${Constantstripe.stripeSecretKey}",
          },
        ),
      );

      if (response.data != null) {
        // print("PaymentIntent created: ${response.data}");
        return response.data['client_secret'];
      } else {
        return null;
      }
    } catch (e) {
      // print("Error in _createPaymentIntent: $e");
      return null;
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      // print("Error in _processPayment: $e");
    }
  }

  String _calculateAmount(int amount) {
    // Stripe expects amount in cents
    return (amount * 100).toString();
  }
}
