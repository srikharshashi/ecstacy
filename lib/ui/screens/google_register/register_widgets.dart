import 'dart:io';
import 'package:bloc_custom_firebase/logic/bloc/google_register/image_uploader/image_uploader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Register3done extends StatefulWidget {
  TextEditingController bio_controller;
  Register3done({required this.bio_controller});

  @override
  _Register3doneState createState() => _Register3doneState();
}

class _Register3doneState extends State<Register3done> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "tell us something about youself!   (bio)",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: 20,
              controller: widget.bio_controller,
              decoration: InputDecoration(
                hintText: "Enter a bio",
                fillColor: Colors.grey[300],
                // filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageUploadinitial extends StatefulWidget {
  TextEditingController name_controller;
  ImageUploadinitial({required this.name_controller});

  @override
  _ImageUploadinitialState createState() => _ImageUploadinitialState();
}

class _ImageUploadinitialState extends State<ImageUploadinitial> {
  Future<File?> pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      File imgtemporary = File(image.path);
      return imgtemporary;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload image Permission")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Send us a pictures to show em 😗",
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickimage().then((image_file) {
                          BlocProvider.of<ImageUploaderCubit>(context)
                              .uploadimage(
                                  image_file, widget.name_controller.text);
                        });
                      },
                      child: Container(
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Icon(FontAwesomeIcons.plus)),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class ImageUploadFinal extends StatelessWidget {
  String url;
  ImageUploadFinal({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              // border:
              //     Border.all(color: Colors.black)),
              child: Text(
                "Hey we got it! 💙",
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).canvasColor == Colors.white
                                      ? Colors.grey.withOpacity(0.5)
                                      : Color(0xFF1a1c1b).withOpacity(0.2),
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 0.2, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                         
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            url,
                          ),
                        )),
                  ],
                )),
          ),
          // Text("70% of users whp got matched were verifed")
        ],
      ),
    );
  }
}
