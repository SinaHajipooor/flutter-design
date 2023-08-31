import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testui/screens/auth/otp_screen.dart';

import '../../helpers/text_formatters.dart';

class PhoneLoginScreen extends StatefulWidget {
  static const routeName = '/phone-login-screen';
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  // --------------- state ----------------

  TextEditingController _controller = TextEditingController();
  bool showPrefixIcon = false;
  // --------------- methods ----------------

  void _onPhoneNumberChange(String value) {
    setState(() {
      showPrefixIcon = value.replaceAll(' ', '').length == 10;
    });
  }

  // --------------- UI ----------------
  @override
  Widget build(BuildContext context) {
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
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            TextFormField(
                              textDirection: TextDirection.ltr,
                              onChanged: _onPhoneNumberChange,
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey[700]),
                              decoration: InputDecoration(
                                labelText: 'تلفن همراه',
                                labelStyle: const TextStyle(fontSize: 13),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                suffix: const Padding(
                                  padding: EdgeInsets.only(left: 8, right: 10),
                                  child: Text('+98', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                ),
                                prefixIcon: showPrefixIcon ? const Icon(Icons.check_circle, color: Colors.green, size: 28) : null,
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
                                onPressed: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 500), // Set animation duration
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(1.0, 0.0), // Set starting position
                                            end: Offset.zero, // Set ending position
                                          ).animate(animation),
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animation, secondaryAnimation) => const OtpScreen(), // Replace with your screen
                                    ),
                                  );
                                },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
