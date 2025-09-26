import 'package:flutter/material.dart';
import 'package:octagon_of_ufc/models/fight.dart';
import 'package:octagon_of_ufc/screens/fight_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<Fight> allFights;

  const SearchScreen({super.key, required this.allFights});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Fight> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchResults = widget.allFights;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _performSearch(_searchController.text);
  }

  void _performSearch(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _searchResults = widget.allFights.where((fight) {
        return fight.eventName.toLowerCase().contains(lowerCaseQuery) ||
            fight.fighter1.toLowerCase().contains(lowerCaseQuery) ||
            fight.fighter2.toLowerCase().contains(lowerCaseQuery) ||
            fight.location.toLowerCase().contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Search Fights',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by event, fighter, or location...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
          ),
        ),
      ),
      body: _searchResults.isEmpty && _searchController.text.isNotEmpty
          ? const Center(
        child: Text(
          'No results found.',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final fight = _searchResults[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FightDetailScreen(fight: fight),
                ),
              );
            },
            child: Card(
              color: Colors.grey[900],
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[800],
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
                          fight.imageUrl != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              fight.imageUrl!,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/ufc_logo.png',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white38,
                                      ),
                                      const Text(
                                        'No Image',
                                        style: TextStyle(color: Colors.white54, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                              : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/ufc_logo.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white38,
                                ),
                                const Text(
                                  'No Image',
                                  style: TextStyle(color: Colors.white54, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${fight.fighter1} vs ${fight.fighter2}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${fight.dateTime.day.toString().padLeft(2, '0')}/${fight.dateTime.month.toString().padLeft(2, '0')}/${fight.dateTime.year} - ${fight.dateTime.hour.toString().padLeft(2, '0')}:${fight.dateTime.minute.toString().padLeft(2, '0')} WIB',
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            fight.location,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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