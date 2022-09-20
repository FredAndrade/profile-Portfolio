import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  Color topColor = Colors.blueGrey;
  Color bottomColor = Colors.blue;

  var colorList =[
    Colors.lightBlueAccent,
    Colors.lightBlue,
    Colors.blueAccent,
    Colors.greenAccent
  ];

  var index = 0;
  late Uri link;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5), (){
        setState(() {
          bottomColor = Colors.grey;
        });
    }
    );
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 15),
            onEnd: (){
              setState(() {
                index++;
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];
              });
            },
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors: [
                      topColor, bottomColor,
                    ])),
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/foto.png'),
                  radius: 90,
                ),
                const SizedBox(height: 25,),
                const Text('Frederico Andrade', style: TextStyle(fontSize: 27,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 55.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                 ),
                ),
                const SizedBox(height: 10,),
                const Text('Desenvolvedor Mobile Flutter | iOS Nativo', style: TextStyle(fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                 ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () async {
                      link = Uri.parse('https://github.com/FredAndrade');
                      if(await canLaunchUrl(link)){
                        launchUrl(link);
                      }
                    },
                        icon: Image.asset(
                          "assets/github.png",
                          color: Colors.white70,
                        )
                    ),
                    IconButton(onPressed: () async{
                      link = Uri.parse('https://linkedin.com/in/freedandrade/');
                      if(await canLaunchUrl(link)){
                      launchUrl(link);
                      }
                      },
                        icon: Image.asset(
                          "assets/linkedin.png",
                          color: Colors.white70,
                        )
                    ),
                    IconButton(onPressed: () async{
                      link = Uri.parse("mailto: freedandrade@gmail.com");
                      await launchUrl(link);
                    },
                        icon: Image.asset(
                          "assets/arroba.png",
                          color: Colors.white70,
                        )
                    ),
                    IconButton(onPressed: () async{
                      link = Uri.parse("tel:34992639363");
                      await launchUrl(link);
                    },
                        icon: Image.asset(
                          "assets/phone.png",
                          color: Colors.white70,
                        )
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
