import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'config/colors.dart';
import 'config/size.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  String _imageToShow = "assets/visacardlogo.png";

  void updateImage(num) {
    setState(() {
      print("Num $num");
      print("Type ");
      print(num.runtimeType);
      switch (num) {
        case '3':
          _imageToShow = 'assets/amexlogo.png';
          break;
        case '4':
          _imageToShow = 'assets/visacardlogo.png';
          break;
        case '5':
          _imageToShow = 'assets/mastercardlogo.png';
          break;
        case '6':
          _imageToShow = 'assets/discoverlogo.png';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryWhite,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          print("Selected:");
          print(value);
          if (value == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddCard()));
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Dashboard'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Add Transaction'),
            icon: Icon(Icons.plus_one),
          ),
          BottomNavigationBarItem(
            title: Text('Add Account / Card'),
            icon: Icon(Icons.credit_card),
          )
        ],
      ),
      body: Container(
        color: AppColors.primaryWhite,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  height: height / 8,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            child: Text(
                          "Add a New Card / Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )),
                      ],
                    ),
                  )),
              Expanded(
                  child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter your Account Name'),
                        autofocus: true,
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a card number';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter Card Number'),
                        autofocus: true,
                        onChanged: (text) {
                          print(text);
                          updateImage(text[0]);
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        width: width / 1.8,
                        child: Image.asset(
                          _imageToShow,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            // Scaffold.of(context).showSnackBar(
                            //     SnackBar(content: Text('Processing Data')));
                            print("Success");
                          }
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ))
              // Expanded(
              //   child: CardWidget(),
              // ),
              // Expanded(child: ExpensesWidget())
            ],
          ),
        ),
      ),
    );
  }
}
