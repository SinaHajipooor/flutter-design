import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:testui/screens/root/home_screen.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp-screen';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // --------------- state ----------------
  final TextEditingController pinEditingController = TextEditingController();
  Timer? _timer;
  int _startSeconds = 90;
  int _elapsedSeconds = 0;
  // --------------- lifecycle ----------------
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  // --------------- methods ----------------
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_startSeconds <= 0) {
          _timer!.cancel();
        } else {
          _startSeconds = _startSeconds - 1;
          _elapsedSeconds = _elapsedSeconds + 1;
        }
      });
    });
  }
  // --------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    final remainingDuration = Duration(seconds: _startSeconds);
    final remaining = '${remainingDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${remainingDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    final PinDecoration pinDecoration = BoxLooseDecoration(
      strokeColorBuilder: PinListenColorBuilder(Colors.grey.shade600.withOpacity(0.2), Colors.grey.shade300),
      radius: const Radius.circular(10),
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      obscureStyle: ObscureStyle(
        isTextObscure: false,
        obscureText: '●',
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
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
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black38),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Center(
                              child: PinInputTextField(
                                controller: pinEditingController,
                                decoration: pinDecoration,
                                pinLength: 5,
                                autoFocus: false,
                                textInputAction: TextInputAction.done,
                                onSubmit: (pin) => print(pin),
                              ),
                            ),
                            const SizedBox(height: 38),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
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
                remaining == '00:00'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('پیامک را دریافت نکردید ؟', style: TextStyle(fontSize: 14)),
                          TextButton(onPressed: () {}, child: const Text('دوباره ارسال کن', style: TextStyle(fontSize: 11, color: Colors.purple))),
                        ],
                      )
                    : Center(
                        child: Text(
                          'زمان باقی مانده : $remaining',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
