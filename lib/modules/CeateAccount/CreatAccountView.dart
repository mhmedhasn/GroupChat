import 'package:armando/base.dart';
import 'package:armando/modules/CeateAccount/Button_animate.dart';
import 'package:armando/modules/CeateAccount/CreateAccountNavigator.dart';
import 'package:armando/modules/CeateAccount/CreateAccountViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = 'CreateAccount';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState
    extends BaseView<CreateAccountScreen, CreateAccountViewModel> implements CreateAccountNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator=this;
  }

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/backgroundcreat.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.black),
                )),
            body: Padding(
              padding: const EdgeInsets.all(22),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == '' && value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('First name'),
                          // hintText: 'First name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == '' && value!.isEmpty) {
                            return 'Please enter your last';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Last name'),
                          // hintText: 'First name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == '' && value!.isEmpty) {
                            return 'Please enter your user name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('user name'),
                          // hintText: 'First name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        validator: (value) {
                          if (value == '' || value == null) {
                            return 'Please enter your email ';
                          }
                          // const String email = "tony@starkindustries.com"
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Please enter valid email ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text(' Email'),
                          // hintText: 'First name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == '' && value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          hintText: 'First name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      MinimalisticButton(
                        onTap: () {
                          print('_________');
                          validateFormButton();
                        },
                        text: 'Create Account',
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void validateFormButton() {
    if (formKey.currentState!.validate()) {
      ViewModel.CreatAccountButton(
          emailController.text, passwordController.text);
    }
  }

  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }
}
