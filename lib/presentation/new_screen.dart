import 'package:flutter/material.dart';
import 'package:noti/presentation/main_screen.dart';

class NewScreen extends StatelessWidget {
  final String first;
  final String second;
  const NewScreen({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onTertiaryContainer;
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen',
        style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: -5,
        backgroundColor: color,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(first,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              box,
              Text(second,style: const TextStyle(fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
