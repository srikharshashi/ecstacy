import 'package:bloc_custom_firebase/logic/bloc/cardcontrollercubi/cardcontroller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';

// class User_Card extends StatefulWidget {
//   String photoURL;
//   User_Card({required this.photoURL});

//   @override
//   _User_CardState createState() => _User_CardState();
// }

// class _User_CardState extends State<User_Card> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox.expand(child: buildfrontCard()),
//     );
//   }

//   Widget buildfrontCard() {
//     return GestureDetector(
//       child: BlocBuilder<CardcontrollerCubit, CardcontrollerState>(
//         builder: (context, state) {
//           final provider = BlocProvider.of<CardcontrollerCubit>(context);
//           return AnimatedContainer(
//               curve: Curves.easeInOut,
//               transform: Matrix4.identity()
//                 ..translate(provider.position.dx, provider.position.dy),
//               duration: Duration(milliseconds: 0),
//               child: buildcard());
//         },
//       ),
//       onPanStart: (details) {
//         final provider = BlocProvider.of<CardcontrollerCubit>(context);
//       },
//       onPanUpdate: (details) {
//         final provider = BlocProvider.of<CardcontrollerCubit>(context);
//       },
//       onPanEnd: (details) {
//         final provider = BlocProvider.of<CardcontrollerCubit>(context);
//       },
//     );
//   }

//   Widget buildcard() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(22),
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: NetworkImage(widget.photoURL), fit: BoxFit.cover),
//         ),
//       ),
//     );
//   }
// }

class User_Card extends StatefulWidget {
  String photoURL;
  User_Card({required this.photoURL});

  @override
  _User_CardState createState() => _User_CardState();
}

class _User_CardState extends State<User_Card> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: TCard(
          slideSpeed: 12,
          size: (Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.8)),
          cards: getcards(MediaQuery.of(context).size.height),
          lockYAxis: true,
        ),
      ),
    ]);
  }
}

List<String> images = [
  "https://firebasestorage.googleapis.com/v0/b/datingapp-8cfc4.appspot.com/o/users%2Fdemousers%2Fitadori.jpg?alt=media&token=c0af6d85-6695-4226-a53e-bf935662d78a",
  'https://firebasestorage.googleapis.com/v0/b/datingapp-8cfc4.appspot.com/o/users%2Fdemousers%2Fmegumi.jpg?alt=media&token=523848fb-7651-4876-b9bf-61a4ee2f8bc0',
  'https://firebasestorage.googleapis.com/v0/b/datingapp-8cfc4.appspot.com/o/users%2Fdemousers%2Fnezuko.jpeg?alt=media&token=7bb5b574-8e9c-4464-a6db-41f5fc99416e',
  'https://firebasestorage.googleapis.com/v0/b/datingapp-8cfc4.appspot.com/o/users%2Fdemousers%2Fsukuna-yuji-itadori-de-jujutsu-kaisen-6714.jpg?alt=media&token=6b1b05c8-1ccf-4403-a58d-962737ad8089',
  'https://firebasestorage.googleapis.com/v0/b/datingapp-8cfc4.appspot.com/o/users%2Fdemousers%2Ftam%3Dnjiro.jpg?alt=media&token=1c52fc03-5f6b-47ca-9240-dbae822b0490',
];

List<Widget> getcards(double height) => List.generate(
      images.length,
      (int index) {
        return Stack(children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23.0,
                  spreadRadius: -13.0,
                  color: Colors.black54,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: height / 2.2,
            left: 10,
            child: Text(
              "Megumi ",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[600]),
            ),
          ),
          Positioned(
            top: height / 2.0,
            left: 15,
            child: Text(
              "18",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[600]),
            ),
          ),
          Positioned(
              top: height / 1.8,
              left: 15,
              child: Icon(
                FontAwesomeIcons.mars,
                size: 20,
                color: Colors.purple[600],
              )),
          Positioned(
            top: height / 1.7,
            left: 15,
            child: Text(
              "man my dad is as strong as gojo",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[600]),
            ),
          )
        ]);
      },
    );
