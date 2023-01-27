import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';
import '../utils/index.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentData data = Get.arguments as PaymentData;

    return IamportPayment(
      appBar: AppBar(
        title: Text('결제'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      userCode: Utils.getUserCodeByPg(data.pg!),
      data: data,
      callback: (Map<String, String> result) {
        Get.offNamed('/payment-result', arguments: result);
      },
    );
  }
}
