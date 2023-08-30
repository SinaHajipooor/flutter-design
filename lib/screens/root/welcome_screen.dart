import 'package:flutter/material.dart';
import 'package:testui/services/imports/app_imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'خوش آمدید',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'سامانه جامع مدیریت مراکز حجی فلاتر',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black38),
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/images/auth.png',
                    width: 240,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 20),
                child: Column(
                  children: [
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
                          child: Text('ورود با اطلاعات کاربری', style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pushNamed(PhoneLoginScreen.routeName),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14),
                          child: Text('ورود با تلفن همراه', style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
