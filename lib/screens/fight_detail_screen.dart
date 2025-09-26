import 'package:flutter/material.dart';
import 'package:octagon_of_ufc/models/fight.dart';

class FightDetailScreen extends StatelessWidget {
  final Fight fight;

  const FightDetailScreen({super.key, required this.fight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          fight.eventName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/image_def00b.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      fight.imageUrl ?? 'assets/images/ufc_logo.png',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                      color: fight.imageUrl == null ? Colors.white38 : null,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/ufc_logo.png',
                                width: 80,
                                height: 80,
                                color: Colors.white38,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Image Not Available',
                                style: TextStyle(color: Colors.white54, fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${fight.fighter1} vs ${fight.fighter2}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${fight.dateTime.day.toString().padLeft(2, '0')}/${fight.dateTime.month.toString().padLeft(2, '0')}/${fight.dateTime.year} - ${fight.dateTime.hour.toString().padLeft(2, '0')}:${fight.dateTime.minute.toString().padLeft(2, '0')} WIB',
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Location: ${fight.location}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'About the Fight:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              fight.description ?? 'Deskripsi pertarungan ini belum tersedia.',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}