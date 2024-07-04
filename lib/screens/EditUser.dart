import 'package:flutter/material.dart';
import 'package:machinetesttodo/model/User.dart';
import 'package:machinetesttodo/services/userService.dart';
class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key,required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  var _userFirstNameController = TextEditingController();
  var _userLastNameController = TextEditingController();
  var _userEmailController = TextEditingController();
  var _userContactController = TextEditingController();
  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateEmail = false;
  bool _validateContact = false;
  var _userService=UserService();

  @override
  void initState() {
    setState(() {
      _userFirstNameController.text=widget.user.firstName??'';
      _userLastNameController.text=widget.user.lastName??'';
      _userContactController.text=widget.user.contact??'';
      _userEmailController.text=widget.user.email??'';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit New User',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userFirstNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter First Name',
                    labelText: 'First Name',
                    errorText:
                    _validateFirstName ? 'First Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userLastNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Last Name',
                    labelText: 'Last Name',
                    errorText:
                    _validateLastName ? 'Last Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userContactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Contact',
                    labelText: 'Contact',
                    errorText: _validateContact
                        ? 'Contact Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter EmailId',
                    labelText: 'EmailId',
                    errorText: _validateEmail
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userFirstNameController.text.isEmpty
                              ? _validateFirstName = true
                              : _validateFirstName = false;
                          _userLastNameController.text.isEmpty
                              ? _validateLastName = true
                              : _validateLastName = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _userEmailController.text.isEmpty
                              ? _validateEmail = true
                              : _validateEmail = false;

                        });
                        if (_validateFirstName == false && _validateLastName == false &&
                            _validateContact == false &&
                            _validateEmail == false) {
                          // print("Good Data Can Save");
                          var _user = User();
                          _user.id=widget.user.id;
                          _user.firstName = _userFirstNameController.text;
                          _user.lastName = _userLastNameController.text;
                          _user.contact = _userContactController.text;
                          _user.email = _userEmailController.text;
                          var result=await _userService.UpdateUser(_user);
                          Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userFirstNameController.text = '';
                        _userLastNameController.text = '';
                        _userContactController.text = '';
                        _userEmailController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
