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

  //List Box widget
  List<BoxWidget> boxWidgets = const [
    BoxWidget(
        title: "LIVING ROOM",
        temp: "26\u2103",
        humid: "50%",
        img: "assets/images/living_room.jpg"),
    BoxWidget(
        title: "BED ROOM",
        temp: "22\u2103",
        humid: "30%",
        img: "assets/images/bed_room.jpg"),
    BoxWidget(
        title: "KITCHEN ROOM",
        temp: "22\u2103",
        humid: "40%",
        img: "assets/images/kitchen_room.jpg")
  ];

  //List Icon Light widget
  List<Items> items = [
    Items(
        iconOn: const Icon(
          Icons.lightbulb,
          size: 50,
          color: Colors.white,
        ),
        iconOff: const Icon(
          Icons.lightbulb_outline,
          size: 50,
          color: Colors.white,
        ),
        name: "ĐÈN"),
    Items(
        iconOn: const Icon(
          Icons.camera_indoor,
          size: 50,
          color: Colors.white,
        ),
        iconOff: const Icon(
          Icons.camera_indoor_outlined,
          size: 50,
          color: Colors.white,
        ),
        name: "CAMERA"),
    Items(
        iconOn: const Icon(
          Icons.ac_unit,
          size: 50,
          color: Colors.white,
        ),
        iconOff: const Icon(
          Icons.ac_unit_outlined,
          size: 50,
          color: Colors.white,
        ),
        name: "QUẠT"),
    Items(
        iconOn: const Icon(
          Icons.chalet,
          size: 50,
          color: Colors.white,
        ),
        iconOff: const Icon(
          Icons.chalet_outlined,
          size: 50,
          color: Colors.white,
        ),
        name: "LÒ SƯỞI"),
  ];

  int _value = 0;

  // function toggle the light
  void toggleLight(int index) {
    setState(() {
      lights[index].isOn = !lights[index].isOn;
      _value = index;
    });
  }

  bool _showSlider = false;

  List<double> _temps = [0.5, 0.5, 0.5, 0.5];

  void _onLongPress(int index) {
    setState(() {
      _showSlider = true;
      lights[index].isOn = true;
      _value = index;
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _showSlider = false;
    });
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    // Tính toán giá trị âm lượng dựa trên vị trí y của sự kiện
    final RenderBox box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.globalPosition);
    final percent = 1 - (offset.dy / box.size.height).clamp(0.0, 1.0);

    setState(() {
      _temps[_value] = percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                  height: 630,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.green.shade300,
                          Colors.green.shade500,
                          Colors.green.shade700,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(0, 9),
                        ),
                      ]),
                ),
                Container( //Light Widget
                  margin: const EdgeInsets.fromLTRB(30, 320, 30, 10),
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 40.0,
                    ),
                    itemCount: lights.length,
                    itemBuilder: (context, index) {
                      return LightWidget(
                        isOn: lights[index].isOn,
                        onTap: () => toggleLight(index),
                        onLongPress: () => _onLongPress(index),
                        onLongPressEnd: _onLongPressEnd,
                        onLongPressMoveUpdate: _onLongPressMoveUpdate,
                        iconOn: items[index].iconOn,
                        iconOff: items[index].iconOff,
                        name: items[index].name,
                        index: _temps[index],
                      );
                    },
                  ),
                ),
                Container( //Slide Widget
                  margin: const EdgeInsets.fromLTRB(30, 120, 30, 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.lightGreen.shade200.withOpacity(0.6),
                        Colors.lightGreen.shade300.withOpacity(0.7),
                        Colors.lightGreen.shade500.withOpacity(0.8),
                        Colors.lightGreen.shade700.withOpacity(0.9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightGreen.withOpacity(0.7),
                        offset: Offset(-4, 4),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  height: 200,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return boxWidgets[index];
                    },
                    itemCount: 3,
                    pagination: const SwiperPagination(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      final gradient = LinearGradient(
                        colors: [Colors.red, Colors.orange],
                        stops: [0.0, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      );
                      return gradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      );
                    },
                    child: const Text(
                      'SMART HOME',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Ensure the text color matches the shader
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_showSlider)
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          height: 55,
                          child: Column(
                            children: [
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 10,
                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                                ),
                                child: Slider(
                                  value: _temps[_value],
                                  onChanged: (newValue) {
                                    setState(() {
                                      _temps[_value] = newValue;
                                    });
                                  },
                                  min: 0,
                                  max: 1,
                                ),
                              ),
                              Text(
                                '${(_temps[_value] * 100).toStringAsFixed(0)}%',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          )
                      ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final String title, temp, humid, img;

  const BoxWidget(
      {required this.title,
      required this.temp,
      required this.humid,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                img,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: 120,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
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
              const Text(
                "Temperature",
                style: TextStyle(fontSize: 18),
              ),
              Text(temp, style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Humidity",
                style: TextStyle(fontSize: 18),
              ),
              Text(humid, style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ],
    ));
  }
}

class LightWidget extends StatelessWidget {
  final bool isOn;
  final VoidCallback onTap, onLongPress;
  final GestureLongPressEndCallback onLongPressEnd;
  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;
  final Icon iconOn;
  final Icon iconOff;
  final String name;
  final double index;

  const LightWidget({
    required this.isOn,
    required this.onTap,
    required this.iconOn,
    required this.iconOff,
    required this.name,
    required this.onLongPress,
    required this.onLongPressEnd,
    required this.onLongPressMoveUpdate,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressEnd: onLongPressEnd,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      child: Container(
          decoration: BoxDecoration(
            gradient: isOn
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.orange.shade200.withOpacity(0.6),
                      Colors.orange.shade300.withOpacity(0.7),
                      Colors.orange.shade500.withOpacity(0.8),
                      Colors.orange.shade700.withOpacity(0.9),
                    ],
                  )
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightGreen.shade200.withOpacity(0.6),
                      Colors.lightGreen.shade300.withOpacity(0.7),
                      Colors.lightGreen.shade500.withOpacity(0.8),
                      Colors.lightGreen.shade700.withOpacity(0.9),
                    ],
                  ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: isOn
                    ? Colors.orange.withOpacity(1)
                    : Colors.lightGreen.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(-4, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              isOn ? iconOn : iconOff,
              SizedBox(height: 10),
              isOn?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isOn ? 'ON' : 'OFF'),
                  SizedBox(width: 10),
                  Text("${(index* 100).toStringAsFixed(0)}%"),
                ],
              ):Text(isOn ? 'ON' : 'OFF'),
            ],
          )),
    );
  }
}
