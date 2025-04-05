import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:petshop_applications/modules/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:petshop_applications/modules/register/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _navigtorkey = GlobalKey<NavigatorState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse('https://www.melivecode.com/api/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': _usernameController.text,
      'password': _passwordController.text,
    });
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _showsnackbar(jsonResponse['message']);
      _navigtorkey.currentState?.push(
        MaterialPageRoute(
          builder:
              (context) => TabMenuPage(
                username: jsonResponse['user']['username'],
                avatarUrl: jsonResponse['user']['avatar'],
              ),
        ),
      );
    } else if (response.statusCode == 401) {
      final jsonResponse = jsonDecode(response.body);
      _showsnackbar(jsonResponse['message']);
    } else {
      _showsnackbar('Login failed. Please try again.');
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    print(
      'Logged in with Google: ${FirebaseAuth.instance.currentUser?.displayName}',
    );
  }

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.token,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(
        'Logged in with Facebook: ${FirebaseAuth.instance.currentUser?.displayName}',
      );
    } else {
      print('Facebook login failed: ${result.status}');
    }
  }

  void _showsnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigtorkey,
      onGenerateRoute: (route) {
        return MaterialPageRoute(
          builder:
              (context) => GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
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
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white.withOpacity(0.6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/Logocat.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your username';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 28),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 70),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xFFFFAB80E3),
                                      minimumSize: Size(300, 35),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _login();
                                      }
                                    },
                                    child: const Text('LOG IN'),
                                  ),
                                  SizedBox(height: 70),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          'OR',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 64),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          signInWithFacebook();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/facebook.svg',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          signInWithGoogle();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/google.svg',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print('Line icon tapped');
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/line.svg',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Are you new to ZZZ Hotel?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => RegisterPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'REGISTER',
                                          style: TextStyle(
                                            color: Color(0xFF9747FF),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        );
      },
    );
  }
}
