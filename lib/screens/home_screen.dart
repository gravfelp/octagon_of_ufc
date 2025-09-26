import 'package:flutter/material.dart';
import 'package:octagon_of_ufc/models/fight.dart';
import 'package:octagon_of_ufc/screens/fight_detail_screen.dart';
import 'package:octagon_of_ufc/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Fight> upcomingFights = [
    Fight(
      eventName: 'UFC 302: Makhachev vs Poirier',
      fighter1: 'Islam Makhachev',
      fighter2: 'Dustin Poirier',
      dateTime: DateTime(2025, 6, 2, 7, 0),
      location: 'Prudential Center, Newark, USA',
      imageUrl: 'assets/images/ufc_fight_sample_1.jpg',
      description: 'Pertarungan gelar kelas ringan yang sangat dinantikan antara juara bertahan Islam Makhachev dan penantang veteran Dustin Poirier. Ini akan menjadi ujian berat bagi Poirier untuk merebut sabuk dari juara dominan seperti Makhachev.',
    ),
    Fight(
      eventName: 'UFC 303: McGregor vs Chandler',
      fighter1: 'Conor McGregor',
      fighter2: 'Michael Chandler',
      dateTime: DateTime(2025, 7, 1, 9, 0),
      location: 'T-Mobile Arena, Las Vegas, USA',
      imageUrl: 'assets/images/ufc_fight_sample_2.jpg',
      description: 'Kembalinya superstar Conor McGregor ke Octagon melawan petarung eksplosif Michael Chandler. Pertarungan ini telah lama ditunggu-tunggu dan diharapkan menjadi pertunjukan kembang api.',
    ),
    Fight(
      eventName: 'UFC 304: Edwards vs Muhammad 2',
      fighter1: 'Leon Edwards',
      fighter2: 'Belal Muhammad',
      dateTime: DateTime(2025, 7, 27, 8, 0),
      location: 'Manchester, England',
      imageUrl: 'assets/images/ufc_fight_sample_3.jpg',
      description: 'Duel ulang yang krusial untuk gelar kelas welter. Leon Edwards akan mempertahankan gelarnya melawan Belal Muhammad yang haus kemenangan, yang sebelumnya berakhir dengan no-contest.',
    ),
    Fight(
      eventName: 'UFC 298: Volkanovski vs Topuria',
      fighter1: 'Alexander Volkanovski',
      fighter2: 'Ilia Topuria',
      dateTime: DateTime(2024, 2, 17, 10, 0),
      location: 'Anaheim, California, USA',
      imageUrl: 'assets/images/ufc_fight_sample_6.jpg',
      description: 'Pertarungan brutal di kelas bulu antara dua petarung terbaik. Volkanovski berusaha kembali ke jalur kemenangan melawan Topuria yang tak terkalahkan dan percaya diri.',
    ),
    Fight(
      eventName: 'UFC 299: O\'Malley vs Vera 2',
      fighter1: 'Sean O\'Malley',
      fighter2: 'Marlon Vera',
      dateTime: DateTime(2024, 3, 9, 10, 0),
      location: 'Miami, Florida, USA',
      imageUrl: null,
      description: 'Perebutan gelar kelas bantam di mana O\'Malley berusaha membalas kekalahannya dari Vera. Ini adalah pertarungan yang sangat personal dan dinantikan.',
    ),
    Fight(
      eventName: 'UFC 297: Strickland vs Du Plessis',
      fighter1: 'Sean Strickland',
      fighter2: 'Dricus Du Plessis',
      dateTime: DateTime(2024, 1, 20, 10, 0),
      location: 'Toronto, Ontario, Canada',
      imageUrl: 'assets/images/ufc_fight_sample_7.jpg',
      description: 'Pertarungan sengit untuk gelar kelas menengah. Strickland yang eksentrik akan menghadapi Du Plessis yang tangguh dalam pertarungan yang menjanjikan aksi tanpa henti.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Upcoming Fights',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen(allFights: upcomingFights)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: upcomingFights.length,
        itemBuilder: (context, index) {
          final fight = upcomingFights[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FightDetailScreen(fight: fight)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[800],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/image_def00b.jpg',
                                fit: BoxFit.cover,
                                opacity: const AlwaysStoppedAnimation(0.2),
                              ),
                            ),
                            if (fight.imageUrl != null)
                              Center(
                                child: Image.asset(
                                  fight.imageUrl!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.broken_image, color: Colors.white38, size: 40),
                                          SizedBox(height: 5),
                                          Text(
                                            'Gambar Tidak\nTersedia',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white54, fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            else
                              const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image_not_supported, color: Colors.white38, size: 40),
                                    SizedBox(height: 5),
                                    Text(
                                      'Gambar Tidak\nTersedia',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white54, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fight.eventName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${fight.fighter1} vs ${fight.fighter2}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${fight.dateTime.day.toString().padLeft(2, '0')}/${fight.dateTime.month.toString().padLeft(2, '0')}/${fight.dateTime.year}',
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            fight.location,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}