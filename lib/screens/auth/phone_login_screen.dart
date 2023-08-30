import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/text_formatters.dart';

class PhoneLoginScreen extends StatefulWidget {
  static const routeName = '/phone-login-screen';
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_forward, color: Colors.black54, size: 28),
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/phone-auth.png',
                    width: 240,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 20),
                child: Column(
                  children: [
                    const Text(
                      'احراز هویت',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'شماره تلفن همراه خود را وارد کنید ما یک کد تایید برای شما ارسال خواهیم کرد',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black38),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          TextFormField(
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffix: const Padding(
                                padding: EdgeInsets.only(left: 8, right: 10),
                                child: Text('+98', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                              ),
                              prefixIcon: const Icon(Icons.check_circle, color: Colors.green, size: 28),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              PhoneFormatter(),
                            ],
                          ),
                          const SizedBox(height: 22),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(14),
                                child: Text('ارسال', style: TextStyle(fontSize: 14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }
}
