import 'package:e_commarce_site/core/helper/responsive_halper.dart';
import 'package:flutter/material.dart';

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isMobilePhone()
          ? AppBar(
              title: Text(
                "Select Brance",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            )
          : null,
      body: Column(
        children: [
          if (!ResponsiveHelper.isMobilePhone())
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_pin, color: Colors.red),
                    Text("!005 Avenue 11, Dhaka, Bangladesh", ),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),

                Spacer(),

                Row(
                  children: [
                    Text("Light"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
                    Row(
                      children: [Text("EN"), Icon(Icons.keyboard_arrow_down)],
                    ),
                  ],
                ),
              ],
            ),
          Divider(),
        ],
      ),
    );
  }
}
