import 'package:fitgo/screens/homePage.dart';
import 'package:flutter/material.dart';
//import 'package:app_demo/screens/loginPage.dart';

import 'package:http/http.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';
 // final utente= User();
 
  String? _name;
  String? _email;

TextEditingController _textEditingControllerName=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingControllerName=TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 202, 247), // colore sfondo
      appBar: AppBar(
       // automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        title: Text(ProfilePage.routename),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
      
       children: [
          SizedBox(
              height: 20,
              width: 20,
            ),
         Row(mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,

                          image: NetworkImage(
                                "https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4",
                              ))),
                     
                     
                      ),
              
            ]),

         
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 20,
              width: 20,
            ),
            SizedBox(
                height: 75,
                width: 230,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                   showDialog(
                     context: context,
                     builder: (context)=>AlertDialog(
                      title:Text("Change your name"),
                      content: TextField(
                        controller:_textEditingControllerName,
                      ),
                      
                      actions:[
                        TextButton(
                          child: Text('OK'),
                          onPressed: (){
                           
                           
                            
                          }),
                        TextButton(
                          child: Text('BACK'),
                          onPressed: ()=>Navigator.pop(context),
                        ),
                        
                      ]),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Text('Giacomo Cappon',
                        
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
              width: 20,
            ),
            SizedBox(
                height: 75,
                width: 230,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                     context: context,
                     builder: (context)=>AlertDialog(
                      title:Text("Change your e-mail"),
                      content: TextField(),
                      actions:[
                        TextButton(
                          child: Text('OK'),
                          onPressed: (){}),
                        TextButton(
                          child: Text('BACK'),
                          onPressed: ()=>Navigator.pop(context),
                        ),   
                      ]
                      
                      )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Text(
                        " giorgiocappon@gmail.com",
                        style: TextStyle(
                            fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      
                    ],
                  ),
          
                )),
            SizedBox(
              height: 20,
              width: 20,
            ),
          Card(
            
            child:Container(
              height: 75,
              width: 230,
              padding: EdgeInsets.all(16),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your data',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    )
                  ),
              const SizedBox(height: 13,),
                  Text(
                    'Altri Dati da scrivere',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                  ),

                ]
              ),
            ),
          
          ),
          ],
      ),
       ]
      ),
    );


                  
             
         

          
  
         
  
 
  } //build

void _responseName(){}




} //ProfilePage
//ProfilePage


