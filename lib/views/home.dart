import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonyhub_by_aryan/consts/colors.dart';
import 'package:harmonyhub_by_aryan/consts/text_style.dart';
import 'package:harmonyhub_by_aryan/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:harmonyhub_by_aryan/views/player.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
          backgroundColor: bgDarkColor,
          actions: [
            IconButton(
                onPressed: () {},
                icon:const  Icon(
                  Icons.search,
                  color: whiteColor,
                ))
          ],
          leading: const Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          title: Text("HarmonyHub",
              style: OurStyle(
                size: 18,
              ))),
      body: FutureBuilder<List<SongModel>>(
          future: controller.audioQuery.querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              uriType: UriType.EXTERNAL),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              print(snapshot.data);
              return Center(
                child: Text(
                  "No available song !",
                  style: OurStyle(),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        child: Obx(
                          () => ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            tileColor: bgColor,
                            title: Text(
                              snapshot.data![index].displayNameWOExt,
                              style: OurStyle(size: 15),
                            ),
                            subtitle: Text(
                              "${snapshot.data![index].artist}",
                              style: OurStyle(size: 12),
                            ),
                            leading: QueryArtworkWidget(
                              id: snapshot.data![index].id,
                              type: ArtworkType.AUDIO,
                              nullArtworkWidget: const Icon(Icons.play_arrow,
                                  color: whiteColor, size: 20),
                            ),
                            trailing: controller.playIndex.value == index &&
                                    controller.isPlaying.value
                                ? const Icon(Icons.play_arrow,
                                    color: whiteColor, size: 26)
                                : null,
                            onTap: () {
                              Get.to(() => Player(data: snapshot.data!),
                                  transition: Transition.downToUp);
                              controller.playSong(
                                  snapshot.data![index].uri, index);
                            },
                          ),
                        ));
                  },
                ),
              );
            }
          }),
    );
  }
}
