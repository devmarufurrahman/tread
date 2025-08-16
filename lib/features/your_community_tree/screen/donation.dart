import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/subscriptions/services/stripe_service.dart';
import 'package:tread256/features/your_community_tree/controller/community_tree_controller.dart';
import '../../../core/common/styles/input_decoration.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Donation extends StatelessWidget {
  Donation({super.key});

  final controller = Get.put(CommunityTreeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),

            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text(
                'Donation',
                style: getTextStyle(
                  context: context,
                  color: Color(0xff57B396),
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26),
              CircleAvatar(
                radius: 32,
                backgroundColor: Color(0xff57B396).withValues(alpha: 0.2),
                child: Icon(Icons.church, color: Colors.teal[300], size: 36),
              ),
              SizedBox(height: 10),
              Text(
                'Grace Community Church',
                style: getTextStyle(
                  context: context,
                  color: Color(0xff57B396),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Weekly food drives and youth mentoring\nsee ways to serve or donate.',
                style: TextStyle(
                  color: Color(0xff535A6C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 45),
              Text(
                'Donation Details',
                style: TextStyle(
                  color: Color(0xff57B396),
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 18),
              TextFormField(
                controller: controller.amountController,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintStyle: getTextStyle(
                    context: context,
                    color: Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Enter Amount (USD)',
                  suffixWidget: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Image.asset(
                      'assets/icons/doller_icon.png',
                      width: 5,
                      height: 5,
                    ),
                  ),
                ),
              ),

              // buildTextField(hintText: 'Enter Amount (USD)', label: 'Amount'),
              SizedBox(height: 18),

              TextFormField(
                maxLines: 4,
                decoration: CustomInputDecoration.customInputDecoration(
                  isSuffixIcon: true,
                  hintStyle: getTextStyle(
                    context: context,
                    color: Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Add Not for the organizations........',
                ),
              ),
              SizedBox(height: 68),
              SizedBox(
                width: double.infinity,
                child: CustomButtom(
                  buttonText: "Payment Now",
                  onPressed: () async {
                    int amount =
                        int.tryParse(controller.amountController.text) ?? 0;
                    if (amount > 0) {
                      await StripeServicePayment.instance.makePayment(
                        amount: amount,

                        currency: 'usd',
                      );
                    } else {
                      EasyLoading.showError("Your amount is very low!");
                    }
                  },
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
