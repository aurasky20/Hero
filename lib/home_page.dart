import 'package:flutter/material.dart';
import 'package:hero_mlbb/detail_hero.dart';
import 'package:hero_mlbb/pahlawan.dart';

class HomePage extends StatelessWidget {
  //tidak ada perubahan
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home Page',
            style: TextStyle(color: Color.fromARGB(255, 35, 7, 101)),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "data",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Image.asset(
                    "images/cover.webp",
                    width: 100,
                  )
                ],
              ),
              // Teks Buku
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Heroes MLBB",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),

              //List Buku
              ListView.builder(
                  itemCount: listPahlawan.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final pahlawan = listPahlawan[index];
                    return GestureDetector(
                        onTap: () {
                          //Berpindah Halaman
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(pahlawan: pahlawan)),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 90.0,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 1))
                              ]),
                          child: Row(
                            children: [
                              Image.asset(
                                pahlawan.image,
                                width: 64,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pahlawan.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    pahlawan.categoryPahlawan,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  })
            ]),
          ),
        ));
  }
}