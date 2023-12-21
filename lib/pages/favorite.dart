import 'package:ecomerce_app/pages/profile.dart';
import 'package:ecomerce_app/widgets/ItemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_app/widgets/cartfvr.dart';



class MyHomePage extends StatefulWidget {
     String initialUsername1;
   String initialEmail1;
    String initialPassword1;

  MyHomePage({
    required this.initialUsername1,
    required this.initialEmail1,
    required this.initialPassword1,
  });
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String initialPin1 = '';
  String initialaddress1 = '';
  String initialCity1 = '';
  String initialCountry1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Container pertama dengan IconButton dan Drawer
          ContainerWidget(
             onPressed: () async {
            final changedData = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Prfr(
                  username: widget.initialUsername1,
                  email: widget.initialEmail1,
                  password: widget.initialPassword1,
                  pin: initialPin1,
                  address: initialaddress1,
                  city: initialCity1,
                  country: initialCountry1,
                ),
              ),
            );

            if (changedData != null) {
              setState(() {
                widget.initialUsername1 = changedData['name'];
                widget.initialEmail1 = changedData['email'];
                widget.initialPassword1 = changedData['password'];
                initialPin1 = changedData['pin'];
                initialaddress1 = changedData['address'];
                initialCity1 = changedData['city'];
                initialCountry1 = changedData['country'];
              });
            }
          },
          ),

          // Container kedua menggunakan ScrollableContainer
          Expanded(
            child: ScrollableContainer(),
          ),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatefulWidget {
    final Function onPressed;

  ContainerWidget({required this.onPressed});
  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 100,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sort),
            iconSize: 40,
          ),
          Text(
            'Favorite',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Montsserat-Semi',
            ),
          ),
          IconButton(
             onPressed: () => widget.onPressed(),
            icon: Icon(Icons.supervised_user_circle_outlined,size: 35,),
            iconSize: 40,
          )
        ],
      ),
    );
  }
}

class ScrollableContainer extends StatefulWidget {




  @override
  _ScrollableContainerState createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
              Container(
                height: 800.0, // Atur tinggi container kedua sesuai kebutuhan
              
                decoration: BoxDecoration(
                  color: Color.fromARGB(241, 241, 241, 241),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Crt(),
              ),
    );
  }
}
