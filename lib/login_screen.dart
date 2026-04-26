import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_theme.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();
  bool isButtonEnabled = false;
  String fullPhoneNumber = "";

  Future<void> _verifyPhoneNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Ошибка Firebase: ${e.message}")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                phoneNumber: fullPhoneNumber,
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("Ошибка при отправке: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppTheme.background, Color(0xFF1A1A2E)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.accent.withValues(alpha: 0.1),
                    border: Border.all(color: AppTheme.accent.withValues(alpha: 0.2), width: 2),
                  ),
                  child: const Icon(Icons.moped_rounded, size: 80, color: AppTheme.accent),
                ),
                const SizedBox(height: 30),
                const Text(
                  'DOX DELIVERY',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 4, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text('Быстрая доставка • Erlangen', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 60),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppTheme.cardColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: isButtonEnabled ? AppTheme.accent : Colors.transparent),
                  ),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      fullPhoneNumber = number.phoneNumber ?? "";
                    },
                    onInputValidated: (bool isValid) {
                      setState(() {
                        isButtonEnabled = isValid;
                      });
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      setSelectorButtonAsPrefixIcon: true,
                      leadingPadding: 20,
                    ),
                    initialValue: PhoneNumber(isoCode: 'DE'),
                    textFieldController: controller,
                    cursorColor: AppTheme.accent,
                    formatInput: true,
                    selectorTextStyle: const TextStyle(color: Colors.white),
                    inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Номер телефона',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonEnabled ? AppTheme.accent : Colors.grey[800],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: isButtonEnabled ? _verifyPhoneNumber : null,
                    child: const Text('Получить код', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),

                const SizedBox(height: 30),
                const Text("или", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 30),

                _buildGoogleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        icon: SvgPicture.network(
          'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg',
          width: 24,
        ),
        label: const Text('Продолжить с Google', style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
        },
      ),
    );
  }
}