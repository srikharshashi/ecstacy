import 'package:bloc_custom_firebase/logic/bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Register", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child:
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelText: "Email",
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 50),
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                      if(state is RegisterFail)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Registration Failed")));
                        }
                      if(state is RegisterSuccess)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Registration Successful")));
                          Navigator.pop(context);
                        }
                      } ,
                  builder: (context, state) {
                    if(state is RegisterLoad) {
                      return SpinKitCubeGrid(
                        color: Colors.black,
                      );
                    }
                    else
                      {

                        return InkWell(
                          onTap: ()
                          {
                            BlocProvider.of<RegisterCubit>(context).signin(_emailcontroller.text,
                                _passwordcontroller.text);
                            FocusScopeNode currentFocus = FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }

                          },
                          child: Container(
                            height: 35,
                            width: 20,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.key, size: 20,),
                                  SizedBox(width: 10,),
                                  Text("Register",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        );
                      }
                  },
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
