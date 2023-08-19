import 'package:flutter/material.dart';

class Light {
  bool isOn;
  Light({required this.isOn});
}

class Items {
  Icon iconOn;
  Icon iconOff;
  String name;
  Items({required this.iconOn, required this.iconOff, required this.name});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Light> lights = [
    Light(isOn: false),
    Light(isOn: false),
    Light(isOn: false),
    Light(isOn: false),
  ];

  List<Items> items = [
    Items(iconOn:const Icon(Icons.lightbulb,size: 100,
      color: Colors.white,),
        iconOff:const Icon(Icons.lightbulb_outline,size: 100,
      color: Colors.white,),
        name: "ĐÈN"),
    Items(iconOn:const Icon(Icons.camera_indoor,size: 100,
      color: Colors.white,),
        iconOff:const Icon(Icons.camera_indoor_outlined,size: 100,
          color: Colors.white,),
        name: "CAMERA"),
    Items(iconOn:const Icon(Icons.ac_unit,size: 100,
      color: Colors.white,),
        iconOff:const Icon(Icons.ac_unit_outlined,size: 100,
          color: Colors.white,),
        name: "QUẠT"),
    Items(iconOn:const Icon(Icons.chalet,size: 100,
      color: Colors.white,),
        iconOff:const Icon(Icons.chalet_outlined,size: 100,
          color: Colors.white,),
        name: "LÒ SƯỞI"),
  ];

  void toggleLight(int index) {
    setState(() {
      lights[index].isOn = !lights[index].isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.orange,
      ),
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/farm_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                    child: Column(
                      children: const [
                        Text("SMART FARM", style: TextStyle(fontSize: 50,
                            color: Colors.orange, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                      ),
                      itemCount: lights.length,
                      itemBuilder: (context, index) {
                        return
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30,0,30,0), // Adjust padding here
                              child: LightWidget(
                                isOn: lights[index].isOn,
                                onTap: () => toggleLight(index),
                                iconOn: items[index].iconOn,
                                iconOff: items[index].iconOff,
                                name: items[index].name,
                              )
                          );
                      },
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}

class LightWidget extends StatelessWidget {
  final bool isOn;
  final VoidCallback onTap;
  final Icon iconOn;
  final Icon iconOff;
  final String name;

  const LightWidget({
    required this.isOn,
    required this.onTap,
    required this.iconOn,
    required this.iconOff,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOn ? Colors.orange : Colors.grey.shade300,
            boxShadow: [
              BoxShadow(
                color: isOn
                    ? Colors.orange.withOpacity(1)
                    : Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 50,
                offset: const Offset(0,3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: const TextStyle(fontSize: 18),),
              isOn ? iconOn : iconOff,
              Text(isOn ? 'ON' : 'OFF'),
            ],
          )
      ),
    );
  }
}