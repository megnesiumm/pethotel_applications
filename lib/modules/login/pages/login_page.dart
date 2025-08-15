import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/custom_form_field.dart';
import 'package:petshop_applications/modules/home_page/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:petshop_applications/modules/register/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false, _obscurePassword = true;

  Future<void> _login() async {
    _showLoading();
    try {
      final res = await http.post(
        Uri.parse('https://www.melivecode.com/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
      );
      Navigator.pop(context);
      final json = jsonDecode(res.body);
      _showSnack(json['message']);
      if (res.statusCode == 200) {
        _formKey.currentState!.reset();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }
    } catch (_) {
      Navigator.pop(context);
      _showSnack('An error occurred. Please try again.');
    }
  }

  Future<void> _googleLogin() async {
    final user = await GoogleSignIn().signIn();
    if (user == null) return;
    final auth = await user.authentication;
    await FirebaseAuth.instance.signInWithCredential(
      GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      ),
    );
  }

  Future<void> _facebookLogin() async {
    final result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      await FirebaseAuth.instance.signInWithCredential(
        FacebookAuthProvider.credential(result.accessToken!.token),
      );
    }
  }

  void _showSnack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  void _showLoading() => showDialog(
    context: context,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundlogin.png'),
                fit: BoxFit.cover,
                opacity: 0.6,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 70, 24, 62),
                child: Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white.withOpacity(0.65),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 28),
                        _buildForm(),
                        const SizedBox(height: 70),
                        _buildLoginButton(),
                        const SizedBox(height: 70),
                        _buildOrDivider(),
                        const SizedBox(height: 64),
                        _buildSocialButtons(),
                        const SizedBox(height: 30),
                        _buildRegisterText(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() =>
      Image.asset('assets/images/Logocat.png', width: 150, height: 150);

  Widget _buildForm() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('USERNAME', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      SizedBox(
        height: 40,
        child: CustomFormField(
          controller: _usernameController,
          hintText: 'Username',
          validator: (v) => v!.isEmpty ? 'Please enter your username' : null,
        ),
      ),
      const SizedBox(height: 28),
      const Text('PASSWORD', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      SizedBox(
        height: 40,
        child: CustomFormField(
          controller: _passwordController,
          hintText: 'Password',
          obscureText: _obscurePassword,
          suffixIcon:
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
          onSuffixIconPressed:
              () => setState(() => _obscurePassword = !_obscurePassword),
          validator: (v) => v!.isEmpty ? 'Please enter a password' : null,
        ),
      ),
    ],
  );

  Widget _buildLoginButton() => CustomElevatedButton(
    fontSize: 14,
    text: _isLoading ? 'Loading...' : 'LOG IN',
    onPressed:
        _isLoading
            ? null
            : () async {
              if (_formKey.currentState!.validate()) {
                setState(() => _isLoading = true);
                await _login();
                setState(() => _isLoading = false);
              }
            },
  );

  Widget _buildOrDivider() => Row(
    children: const [
      Expanded(child: Divider(color: Color(0xFF8D8D8D))),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text('OR', style: TextStyle(color: Color(0xFF666666))),
      ),
      Expanded(child: Divider(color: Color(0xFF8D8D8D))),
    ],
  );

  Widget _buildSocialButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: _facebookLogin,
        child: SvgPicture.asset(
          'assets/icons/facebook.svg',
          width: 40,
          height: 40,
        ),
      ),
      GestureDetector(
        onTap: _googleLogin,
        child: SvgPicture.asset(
          'assets/icons/google.svg',
          width: 40,
          height: 40,
        ),
      ),
      GestureDetector(
        onTap: () => print('Line tapped'),
        child: SvgPicture.asset('assets/icons/line.svg', width: 40, height: 40),
      ),
    ],
  );

  Widget _buildRegisterText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Are you new to ZZZ Hotel?',
        style: TextStyle(color: Color(0xFF505050), fontSize: 12),
      ),
      const SizedBox(width: 8),
      GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RegisterPage()),
            ),
        child: const Text(
          'REGISTER',
          style: TextStyle(
            color: Color(0xFF9747FF),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
