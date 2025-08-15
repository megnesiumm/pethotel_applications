import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/custom_form_field.dart';
import 'package:petshop_applications/core/widgets/phone_input_format.dart';
import 'package:petshop_applications/modules/login/pages/login_page.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _selectedCountryCode = '+66';

  final _formKey = GlobalKey<FormState>();
  final List<String> _countryCodes = ['+66', '+1', '+44', '+91'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundlogin.png'),
              fit: BoxFit.cover,
              opacity: (0.6),
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 70, 24, 62),
                  child: _buildRegisterForm(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white.withOpacity(0.65),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min, // แก้ปัญหา RenderBox
          children: [
            Image.asset('assets/images/Logocat.png', width: 150, height: 150),
            const SizedBox(height: 10),
            _buildNameSurnameRow(),
            const SizedBox(height: 22),
            _buildEmailField(),
            const SizedBox(height: 22),
            _buildPhoneField(),
            const SizedBox(height: 22),
            _buildPasswordField(),
            const SizedBox(height: 22),
            _buildConfirmPasswordField(),
            const SizedBox(height: 30),
            _buildRegisterButton(),
            const SizedBox(height: 16),
            _buildLoginLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameSurnameRow() {
    return Row(
      children: [
        Expanded(
          child: _buildTextFieldWithLabel(
            label: 'NAME',
            controller: _nameController,
            hint: 'Enter name',
            validatorMessage: 'Please enter your name',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildTextFieldWithLabel(
            label: 'SURNAME',
            controller: _surnameController,
            hint: 'Enter surname',
            validatorMessage: 'Please enter your surname',
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return _buildTextFieldWithLabel(
      label: 'EMAIL',
      controller: _emailController,
      hint: 'Enter your email',
      validatorMessage: 'Please enter your email',
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PHONE NUMBER',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _buildCountryCodeDropdown(),
            const SizedBox(width: 10),
            Expanded(
              child: CustomFormField(
                controller: _phoneController,
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  PhoneNumberInputFormatter(_selectedCountryCode),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!value.startsWith(_selectedCountryCode)) {
                    return 'Phone must start with $_selectedCountryCode';
                  }
                  final digits = value.replaceAll(RegExp(r'[^\d]'), '');
                  if (digits.length !=
                      (_selectedCountryCode.replaceAll('+', '').length + 10)) {
                    return 'Phone number must be 10 digits';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return _buildTextFieldWithLabel(
      label: 'CREATE PASSWORD',
      controller: _passwordController,
      hint: 'Enter your password',
      validatorMessage: 'Please enter a password',
      obscure: _obscurePassword,
      suffixIcon: _obscurePassword ? Icons.visibility_off : Icons.visibility,
      onSuffixPressed: () => setState(() => _obscurePassword = !_obscurePassword),
    );
  }

  Widget _buildConfirmPasswordField() {
    return _buildTextFieldWithLabel(
      label: 'CONFIRM PASSWORD',
      controller: _confirmPasswordController,
      hint: 'Confirm your password',
      validatorMessage: 'Please confirm your password',
      obscure: _obscureConfirmPassword,
      suffixIcon: _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
      onSuffixPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
    );
  }

  Widget _buildRegisterButton() {
    return CustomElevatedButton(
      fontSize: 14,
      text: 'REGISTER',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.reset();
          _nameController.clear();
          _surnameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();
          setState(() => _selectedCountryCode = '+66');
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Register สำเร็จ!')));
        }
      },
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an Account?', style: TextStyle(color: Colors.black, fontSize: 12)),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
          },
          child: const Text(
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
    );
  }

  Widget _buildCountryCodeDropdown() {
    return Container(
      height: 46,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: DropdownButton<String>(
          value: _selectedCountryCode,
          underline: const SizedBox(),
          onChanged: (value) {
            if (value != null) setState(() => _selectedCountryCode = value);
          },
          items: _countryCodes
              .map((code) => DropdownMenuItem<String>(
                    value: code,
                    child: Text(code),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String validatorMessage,
    bool obscure = false,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        CustomFormField(
          controller: controller,
          hintText: hint,
          obscureText: obscure,
          suffixIcon: suffixIcon,
          onSuffixIconPressed: onSuffixPressed,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) return validatorMessage;
            return null;
          },
        ),
      ],
    );
  }
}
