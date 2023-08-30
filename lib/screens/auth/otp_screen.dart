import 'package:flutter/material.dart';
import 'package:testui/widgets/auth/text_feild_otp.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp-screen';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                    'assets/images/otp.png',
                    width: 240,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 20),
                child: Column(
                  children: [
                    const Text(
                      'تایید احراز هویت',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'ما یک پیامک حاوی کد تایید برای شماره 091555613393 ارسال کردیم. کد را وارد کنید',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black38),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textFeildOtp(context: context, first: true, last: false),
                              textFeildOtp(context: context, first: false, last: false),
                              textFeildOtp(context: context, first: false, last: false),
                              textFeildOtp(context: context, first: false, last: false),
                              textFeildOtp(context: context, first: false, last: true),
                            ],
                          ),
                          const SizedBox(height: 22),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pushNamed(OtpScreen.routeName),
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
                                child: Text('ورود', style: TextStyle(fontSize: 14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'پیامکی دریافت نکردید ؟',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black38),
              ),
              const SizedBox(height: 18),
              const Text(
                'دوباره ارسال کن',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
