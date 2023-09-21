import 'package:flutter/material.dart';
import 'package:restaurant/config/global/variable_global.dart';
import 'package:restaurant/models/restaurant/restaurant_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage extends StatefulWidget {
  final Restaurant restaurant;

  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('restaurantLocation'),
          position: widget.restaurant.location,
          infoWindow: InfoWindow(title: widget.restaurant.name),
        ),
      );
    });
  }

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 300.0,
            child: Image.network(
              widget.restaurant.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 275.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildContent(),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                widget.restaurant.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: widget.restaurant.isFavorite ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  widget.restaurant.isFavorite = !widget.restaurant.isFavorite;
                  if (widget.restaurant.isFavorite) {
                    favoriteRestaurants.add(widget.restaurant);
                  } else {
                    favoriteRestaurants
                        .removeWhere((r) => r.id == widget.restaurant.id);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      const SizedBox(height: 10),
      Text(
        widget.restaurant.name,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          const Icon(Icons.star, color: Colors.yellow, size: 20),
          const SizedBox(width: 5),
          Text('${widget.restaurant.rating}'),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.location_on, color: Colors.grey[700], size: 20),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              widget.restaurant.address,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
      const Divider(),
      const Text('Menu:', style: TextStyle(fontSize: 20)),
      const SizedBox(height: 10),
      SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.restaurant.menus.length,
          itemBuilder: (context, index) {
            var menu = widget.restaurant.menus[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      menu.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Rp ${menu.price.toStringAsFixed(3)}'),
                ],
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 20),
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          height: 200,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: widget.restaurant.location,
              zoom: 15.0,
            ),
            zoomControlsEnabled: false,
          ),
        ),
      ),
    ];
  }
}
