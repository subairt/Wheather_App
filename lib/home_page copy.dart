// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:wheather_app/getLocation.dart';
// import 'package:wheather_app/weatherData.dart';

// var dayInfo = DateTime.now();
// var dateFormat = DateFormat('EEEE, d MMM,yyyy').format(dayInfo);

// // ignore: must_be_immutable
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var client = WeatherData();

//   var data;

//   info() async {
//     var position = await GetPosition();
//     data = await client.getData(position.latitude, position.longitude);
//     return data;
//   }

//     String query = '';

//     TextEditingController searchContrller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         // ignore: avoid_unnecessary_containers
//         body: SingleChildScrollView(
//           child: FutureBuilder(
//               // future: info(),
//          future: client.getData(query.isEmpty ? 'Calicut' : query),

//               builder: ((context, snapshot) {
//                 // ignore: avoid_unnecessary_containers
//                 return Container(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: size.height * 0.75,
//                         width: size.width,
//                         padding: const EdgeInsets.only(top: 30),
//                         margin: const EdgeInsets.only(right: 10, left: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           gradient: const LinearGradient(
//                             colors: [
//                               Color(0xff955cd1),
//                               Color(0xff3fa2fa),
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                             stops: [0.2, 0.85],
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             AnimSearchBar(
//                                 textFieldColor: Colors.white38,
//                                 textFieldIconColor: Colors.white,
//                                 helpText: "Search City",
//                                 color: Colors.grey,
//                                 width: 250,
//                                 textController: searchContrller,
//                                 onSuffixTap: () {
//                                   searchContrller.clear();
//                                 },
//                                 onSubmitted: (p0) {
                                  
//                                 setState(() {
//                                     query = p0;
//                                   });
//                                 },
//                               ),
//                             Text(
//                               '${data?.cityName}',
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.9),
//                                 fontSize: 35,
//                                 fontFamily: 'MavenPro',
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               dateFormat,
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.9),
//                                 fontSize: 15,
//                                 fontFamily: 'MavenPro',
//                               ),
//                             ),
//                             Image.network(
//                               'https:${data?.icon}',
//                               width: size.width * 0.36,
//                               fit: BoxFit.fill,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               '${data?.condition}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 45,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'Hubballi',
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               '${data?.temp}°',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 75,
//                                 fontWeight: FontWeight.w800,
//                                 fontFamily: 'Hubballi',
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/img/storm.png',
//                                         width: size.width * 0.15,
//                                       ),
//                                       Text(
//                                         '${data?.wind}km/h',
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Hubballi',
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         'Wind',
//                                         style: TextStyle(
//                                             color: Colors.white.withOpacity(0.6),
//                                             fontFamily: 'MavenPro',
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/img/humidity.png',
//                                         width: size.width * 0.15,
//                                       ),
//                                       Text(
//                                         '${data?.humidity}',
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Hubballi',
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         'humidity',
//                                         style: TextStyle(
//                                             color: Colors.white.withOpacity(0.6),
//                                             fontFamily: 'MavenPro',
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/img/winddirection.png',
//                                         width: size.width * 0.15,
//                                       ),
//                                       Text(
//                                         '${data?.wind_dir}',
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Hubballi',
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         'winddirection',
//                                         style: TextStyle(
//                                             color: Colors.white.withOpacity(0.6),
//                                             fontFamily: 'MavenPro',
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Gust',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.5),
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${data?.gust} kp/h',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 23,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text(
//                                   'Pressure',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.5),
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${data?.pressure}hpa',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 23,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'UV',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.5),
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${data?.uv}',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 23,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text(
//                                   'Precipitation',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.5),
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${data?.pricipe}mm',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 23,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Wind',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.5),
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${data?.wind} km/h',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 23,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text(
//                                   'Last Update',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.5),
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${data?.last_update}',
//                                   style: const TextStyle(
//                                     color: Colors.green,
//                                     fontFamily: 'MavenPro',
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               })),
//         ));
//   }
// }
