
import 'package:armando/base.dart';
import 'package:armando/modules/add_rome/add_room_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CeateAccount/Button_animate.dart';
import 'add_room_navigator.dart';


class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'AddRoomScreen';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

var NameRoomController = TextEditingController();
var descriptionRoomController = TextEditingController();
var FormKey = GlobalKey<FormState>();

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: Stack(children: [
        Image.asset(
          'assets/images/backgroundcreat.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Card(
                color: Color.fromRGBO(255, 255, 255, 30),
                elevation: 16,
                margin:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 100),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      foregroundColor: Colors.lightBlueAccent,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        centerTitle: true,
                        title: Text(
                          'Create New Group',
                          style: TextStyle(color: Colors.black),
                        )),
                    body: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Form(
                        key: FormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                    width: 130,
                                    height: 130,
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Image.asset(
                                          'assets/images/people.png',
                                        ),
                                        Icon(
                                          Icons.camera_alt,
                                          size: 35,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: NameRoomController,
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return 'Please enter the group name';
                                }
                              },
                              decoration: InputDecoration(
                                label: Text(' group name '),
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
                              height: 18,
                            ),
                            TextFormField(
                              controller: descriptionRoomController,
                              obscureText: true,
                              validator: (value) {
                                if (value == '' && value!.isEmpty) {
                                  return 'Please enter group description';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text('Description'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MinimalisticButton(

                              onTap: () {
                                print('_________');
                                validateFormButton();
                              },

                              text: 'Create ',
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            Container(

                height: 202,
                width: double.infinity,
                color: Color.fromRGBO(158, 230, 255, 1)),
            Container(
                height: MediaQuery.of(context).size.height * .030,
                width: double.infinity,
                color: Color.fromRGBO(79, 232, 141, 1)),
            Container(
                height: MediaQuery.of(context).size.height * .020,
                width: double.infinity,
                color: Color.fromRGBO(175, 98, 53, 1)),
            Container(
              width: MediaQuery.of(context).size.width * .400,
              height: MediaQuery.of(context).size.height * .18,
              child: Image.asset(
                'assets/images/flower.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Positioned(
              right: MediaQuery.of(context).size.width * .080,
              bottom: MediaQuery.of(context).size.width * .290,
              child: Container(
                width: MediaQuery.of(context).size.width * .400,
                height: MediaQuery.of(context).size.height * .18,
                child: Image.asset(
                  'assets/images/cloudy.png',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              right: MediaQuery.of(context).size.width * .070,
              bottom: MediaQuery.of(context).size.width * .00,
              child: Container(
                width: MediaQuery.of(context).size.width * .500,
                height: MediaQuery.of(context).size.height * .20,
                child: Image.asset(
                  'assets/images/source.gif',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }
}

void validateFormButton() {}
