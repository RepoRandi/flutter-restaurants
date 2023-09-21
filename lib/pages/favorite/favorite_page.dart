import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/models/restaurant/restaurant_model.dart';
import 'package:restaurant/pages/detail/detail_page.dart';

class FavoritePage extends StatefulWidget {
  final List<Restaurant> favoriteRestaurants;

  const FavoritePage({Key? key, required this.favoriteRestaurants})
      : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Widget _buildRating(double rating) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 16));
      } else if (rating > i - 1 && rating < i) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 16));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 16));
      }
    }

    return Row(children: stars);
  }

  void _clearAllFavorites() {
    setState(() {
      widget.favoriteRestaurants.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favorite Restaurants', style: GoogleFonts.robotoSlab()),
      ),
      body: widget.favoriteRestaurants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 100,
                    color: Colors.grey,
                  ),
                  Text(
                    "No favorite restaurants found!",
                    style: GoogleFonts.robotoSlab(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget.favoriteRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = widget.favoriteRestaurants[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(restaurant: restaurant),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Image.network(
                              restaurant.imageUrl,
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurant.name,
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: restaurant.name.length < 20
                                            ? 20
                                            : 14,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    _buildRating(restaurant.rating),
                                    const SizedBox(height: 5),
                                    Text(
                                      restaurant.address.length > 50
                                          ? "${restaurant.address.substring(0, 45)}..."
                                          : restaurant.address,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (restaurant.isFavorite)
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Text(
                                    "FAVORITE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearAllFavorites,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.delete),
      ),
    );
  }
}
