import 'dart:ui';

import 'package:hero_mlbb/pahlawan.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Pahlawan pahlawan;
  const DetailPage({super.key, required this.pahlawan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pahlawan.name, style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Color.fromARGB(255, 17, 19, 67),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(pahlawan.image),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: Image.asset(
                  pahlawan.image,
                  width: 130,
                ),
              ),
            ),
          ),
          //Judul

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                pahlawan.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Deskripsi Hero
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pahlawanInfo(pahlawan.skill1.toString(), "Skill 1"), 
              pahlawanInfo(pahlawan.skill2.toString(), "Skill 2"),
              pahlawanInfo(pahlawan.ulti.toString(), "Ultimate"),
            ],
          ),
          const SizedBox(height: 20),
          //Deskripsi
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text("Deskripsi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
            child: pahlawanDesc(
              pahlawan.description,
            ),
          ),
        ],
      ),
    );
  }

  Widget pahlawanInfo(String value, String info) {
    return Column(
      children: [
        Image.asset(
          value,
          width: 75,
          height: 75,
          fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran tanpa merusaknya
        ),
        const SizedBox(height: 5),
        Text(
          info,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
    ],
    );
  }

  Widget pahlawanDesc(String desc) {
    return Column(
      children: [
        Text(
          desc,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
