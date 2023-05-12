import 'package:flutter/material.dart';
import 'package:portfolio/components/research.dart';
import 'components/projects.dart';
import 'components/about.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('AJAY'),
      backgroundColor: Colors.black12,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Project()));
          },
          child: const Text(
            'Projects',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Research()));
          },
          child: const Text(
            'Research',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const About()));
          },
          child: const Text(
            'About',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth < 600;
    return Scaffold(
        appBar: const MyAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 150.0),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage(''),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'I am Ajay',
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  color: Colors.grey[700],
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: const [
                      // Image.network(snapshot.data!.docs[index]['Image']),
                      ListTile(
                        isThreeLine: false,
                        title: Text(
                          'Project',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                        subtitle: Text('This is a small project',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
