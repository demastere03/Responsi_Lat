import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
      'Main Menu',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildMenu(),
    );
  }
  Widget _buildMenu() {
    return InkWell(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
                child: FlutterLogo()
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("News"),
                Text("Get an Overview of the Latest Spaceflight news, from Various Sources! Easily link your users to the right website"),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
