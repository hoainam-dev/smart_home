import 'package:flutter/material.dart';
import 'package:workplace/widgets/root.dart';

void main() {
  runApp(Root());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SMART HOME',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Root(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//
//
//
//   List<Light> lights = [
//     Light(isOn: false),
//     Light(isOn: false),
//     Light(isOn: false),
//     Light(isOn: false),
//   ];
//
//   List<Icon> iconsOn = [
//     Icon(Icons.lightbulb,size: 100,
//       color: Colors.white,),
//     Icon(Icons.camera_indoor,size: 100,
//       color: Colors.white,),
//     Icon(Icons.ac_unit,size: 100,
//       color: Colors.white,),
//     Icon(Icons.chalet,size: 100,
//       color: Colors.white,)
//   ];
//
//   List<Icon> iconsOff = [
//     Icon(Icons.lightbulb_outline,size: 100,
//       color: Colors.white,),
//     Icon(Icons.camera_indoor_outlined,size: 100,
//     color: Colors.white,),
//     Icon(Icons.ac_unit_outlined,size: 100,
//       color: Colors.white,),
//     Icon(Icons.chalet_outlined,size: 100,
//       color: Colors.white,)
//   ];
//
//   void toggleLight(int index) {
//     setState(() {
//       lights[index].isOn = !lights[index].isOn;
//     });
//   }
//
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: Colors.green.shade800,
//         accentColor: Colors.orange,
//       ),
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/farm_background.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     Text("Smart Home")
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
//                 padding: EdgeInsets.all(20),
//                 child: Center(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 5.0,
//                       crossAxisSpacing: 5.0,
//                     ),
//                     itemCount: lights.length,
//                     itemBuilder: (context, index) {
//                       return
//                         Padding(
//                             padding: EdgeInsets.fromLTRB(30,0,30,0), // Adjust padding here
//                             child: LightWidget(
//                               isOn: lights[index].isOn,
//                               onTap: () => toggleLight(index),
//                               iconOn: iconsOn[index],
//                               iconOff: iconsOff[index],
//                             )
//                         );
//                     },
//                   ),
//                 ),
//               )
//             ],
//           )
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: onTabTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Settings',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LightWidget extends StatelessWidget {
//   final bool isOn;
//   final VoidCallback onTap;
//   final Icon iconOn;
//   final Icon iconOff;
//
//   const LightWidget({
//     required this.isOn,
//     required this.onTap,
//     required this.iconOn,
//     required this.iconOff,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150,
//         height: 150,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isOn ? Colors.orange : Colors.grey.shade300,
//           boxShadow: [
//             BoxShadow(
//               color: isOn
//                   ? Colors.orange.withOpacity(1)
//                   : Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 50,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             isOn ? iconOn : iconOff,
//             Text(isOn ? 'ON' : 'OFF'),
//           ],
//         )
//       ),
//     );
//   }
// }
