import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harmonyhub_by_aryan/consts/colors.dart';
import 'package:harmonyhub_by_aryan/consts/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
            )),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Text(
                    "Music name",
                    style: OurStyle(
                      color: bgDarkColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Artist name",
                      style: OurStyle(
                        color: bgDarkColor,
                        size: 20,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "0:0",
                        style: OurStyle(
                          color: bgDarkColor,
                        ),
                      ),
                      Slider(value: 0.0, onChanged: (newValue) {}),
                      Text(
                        "0.4:00",
                        style: OurStyle(
                          color: bgDarkColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
