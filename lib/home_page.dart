import 'package:flutter/material.dart';
import 'package:hero_mlbb/detail_hero.dart';
import 'package:hero_mlbb/pahlawan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double newOpacity = 1 - (_scrollController.offset / 200);
      if (newOpacity < 0) newOpacity = 0; // Opacity minimal 0
      setState(() {
        _opacity = newOpacity;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            color: const Color.fromARGB(255, 231, 234, 240),
          ),
          // Konten dengan efek scroll
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // AppBar akan muncul saat scroll
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                backgroundColor: const Color.fromARGB(255, 26, 33, 79),
                title: _opacity == 0
                    ? const Text(
                        "Home Page",
                        style: TextStyle(color: Colors.white),
                      )
                    : null, // Hanya muncul saat gambar tertutup
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "images/cover.webp",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Daftar Hero MLBB",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600,),
                        ),
                      ),
                      ListView.builder(
                        itemCount: listPahlawan.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final pahlawan = listPahlawan[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(pahlawan: pahlawan),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 90.0,
                              // padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 1))
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch, // Membuat gambar full tinggi
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10), 
                                      bottomLeft: Radius.circular(10),
                                    ), // Membuat border hanya di kiri
                                    child: Image.asset(
                                      pahlawan.image,
                                      width: 60, // Atur lebar agar gambar tidak terlalu kecil
                                      fit: BoxFit.cover, // Memastikan gambar penuh di container
                                    ),
                                  ),
                                  const SizedBox(width: 20), // Jarak antara gambar dan teks
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pahlawan.name,
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          pahlawan.heroName,
                                          style: const TextStyle(fontSize: 12, color: Colors.blueGrey, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          pahlawan.categoryPahlawan,
                                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
