import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/custom_form_field.dart';
import 'package:petshop_applications/modules/login/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _PhoneNumberInputFormatter extends TextInputFormatter {
  final String countryCode;

  _PhoneNumberInputFormatter(this.countryCode);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // ตัด country code ออกก่อน format
    String text = newValue.text;

    // ลบช่องว่าง + ค่าที่พิมพ์ซ้ำกับ countryCode
    String numericOnly = text
        .replaceFirst(countryCode, '')
        .replaceAll(RegExp(r'[^\d]'), '');

    // จำกัดให้พิมพ์ได้ไม่เกิน 10 ตัว
    if (numericOnly.length > 10) {
      numericOnly = numericOnly.substring(0, 10);
    }

    // แยกตาม pattern: 3-3-4
    String formatted = '';
    if (numericOnly.length >= 1) {
      formatted = countryCode + ' ';
      if (numericOnly.length <= 3) {
        formatted += numericOnly;
      } else if (numericOnly.length <= 6) {
        formatted +=
            numericOnly.substring(0, 3) + ' ' + numericOnly.substring(3);
      } else {
        formatted +=
            numericOnly.substring(0, 3) +
            ' ' +
            numericOnly.substring(3, 6) +
            ' ' +
            numericOnly.substring(6);
      }
    } else {
      formatted = countryCode + ' ';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _selectedCountryCode = '+66';

  final List<String> _countryCodes = ['+66', '+1', '+44', '+91'];

  @override
  Widget build(BuildContext context) {
    // คำนวณขนาดหน้าจอ
    double screenWidth = MediaQuery.of(context).size.width;

    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Noto Sans'),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
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
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white.withOpacity(0.65),
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
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'NAME',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    CustomFormField(
                                      controller: _nameController,
                                      hintText: 'Enter name',
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'SURNAME',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    CustomFormField(
                                      controller: _surnameController,
                                      hintText: 'Enter surname',
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your surname';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 22),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'EMAIL',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              CustomFormField(
                                controller: _emailController,
                                hintText: 'Enter your email',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 22),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PHONE NUMBER',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(
                                    height: 36,
                                    width: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: DropdownButton<String>(
                                      value: _selectedCountryCode,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                      ),
                                      underline: SizedBox(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            _selectedCountryCode = value;

                                            final regex = RegExp(r'^\+\d+\s*');
                                            String current = _phoneController
                                                .text
                                                .replaceFirst(regex, '');
                                            _phoneController.text =
                                                "$_selectedCountryCode $current";
                                            _phoneController.selection =
                                                TextSelection.fromPosition(
                                                  TextPosition(
                                                    offset:
                                                        _phoneController
                                                            .text
                                                            .length,
                                                  ),
                                                );
                                          });
                                        }
                                      },
                                      items:
                                          _countryCodes.map((code) {
                                            return DropdownMenuItem<String>(
                                              value: code,
                                              child: Text(code),
                                            );
                                          }).toList(),
                                      // ขยาย DropdownButton ให้เต็มความกว้าง
                                      isExpanded: true,
                                      hint: Text('Select Country Code'),
                                      style: TextStyle(fontSize: 16),
                                      iconSize: 24,
                                      menuMaxHeight:
                                          200, // Use menuMaxHeight instead
                                      iconEnabledColor: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: CustomFormField(
                                      controller: _phoneController,
                                      hintText: 'Enter your phone number',
                                      inputFormatters: [
                                        _PhoneNumberInputFormatter(
                                          _selectedCountryCode,
                                        ),
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        if (!value.startsWith(
                                          _selectedCountryCode,
                                        )) {
                                          return 'Phone must start with $_selectedCountryCode';
                                        }

                                        final digits = value.replaceAll(
                                          RegExp(r'[^\d]'),
                                          '',
                                        );
                                        if (digits.length !=
                                            (_selectedCountryCode
                                                    .replaceAll('+', '')
                                                    .length +
                                                10)) {
                                          return 'Phone number must be 10 digits';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                            ],
                          ),

                          SizedBox(height: 22),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'CREATE PASSWORD',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              CustomFormField(
                                controller: _passwordController,
                                hintText: 'Enter your password',
                                obscureText: _obscurePassword,
                                suffixIcon:
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                onSuffixIconPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Password must contain a minimum of 8 characters',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 22),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'CONFIRM PASSWORD',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              CustomFormField(
                                controller: _confirmPasswordController,
                                hintText: 'Confirm your password',
                                obscureText: _obscureConfirmPassword,
                                suffixIcon:
                                    _obscureConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                onSuffixIconPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value !=
                                      _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 30),

                          // Register button
                          CustomElevatedButton(
                            text: 'REGISTER',
                            onPressed: () {},
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an Account?',
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
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    color: Color(0xFF9747FF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
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
  }
}
