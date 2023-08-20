import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

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

  List<BoxWidget> boxWidgets = const [
    BoxWidget(title: "LIVING ROOM",temp: "26\u2103", humid: "50%", img: "assets/images/living_room.jpg"),
    BoxWidget(title: "BED ROOM",temp: "22\u2103", humid: "30%", img: "assets/images/bed_room.jpg"),
    BoxWidget(title: "KITCHEN ROOM",temp: "22\u2103", humid: "40%", img: "assets/images/kitchen_room.jpg")
  ];

  List<Items> items = [
    Items(iconOn:const Icon(Icons.lightbulb,size: 50,
      color: Colors.white,),
        iconOff:const Icon(Icons.lightbulb_outline,size: 50,
      color: Colors.white,),
        name: "ĐÈN"),
    Items(iconOn:const Icon(Icons.camera_indoor,size: 50,
      color: Colors.white,),
        iconOff:const Icon(Icons.camera_indoor_outlined,size: 50,
          color: Colors.white,),
        name: "CAMERA"),
    Items(iconOn:const Icon(Icons.ac_unit,size: 50,
      color: Colors.white,),
        iconOff:const Icon(Icons.ac_unit_outlined,size: 50,
          color: Colors.white,),
        name: "QUẠT"),
    Items(iconOn:const Icon(Icons.chalet,size: 50,
      color: Colors.white,),
        iconOff:const Icon(Icons.chalet_outlined,size: 50,
          color: Colors.white,),
        name: "LÒ SƯỞI"),
  ];

  // function toggle the light
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
                SizedBox(
                  height: 300,
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                      return boxWidgets[index];
                    },
                    itemCount: 3,
                    pagination: const SwiperPagination(),
                    control: const SwiperControl(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Center(
                    child: Column(
                      children: const [
                        Text("SMART HOME", style: TextStyle(fontSize: 50,
                            color: Colors.orange, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 8.0,
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

class BoxWidget extends StatelessWidget{
  final String title, temp, humid, img;

  const BoxWidget({
    required this.title,
    required this.temp,
    required this.humid,
    required this.img
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(50, 100, 50, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green.shade200.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0,5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(img, height: 100, width: 100,fit: BoxFit.cover,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: 120,
                    child: Text(title, style: const TextStyle(fontSize: 25,), maxLines:2,textAlign: TextAlign.center,),
                  ),
                  const Icon(Icons.info_outline)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Temperature", style: TextStyle(fontSize: 18),),
                  Text(temp, style: const TextStyle(fontSize: 18))
                ],),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Humidity", style: TextStyle(fontSize: 18),),
                  Text(humid, style: const TextStyle(fontSize: 18))
                ],),
            ),
          ],
        )
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOn ? Colors.orange.withOpacity(0.7) : Colors.green.shade200.withOpacity(0.7),
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
              Text(name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              isOn ? iconOn : iconOff,
              Text(isOn ? 'ON' : 'OFF'),
            ],
          )
      ),
    );
  }
}
