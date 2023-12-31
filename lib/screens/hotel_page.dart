// screens/hotel_page.dart
import 'package:flutter/material.dart';
import 'package:tiket/models/hotel_data.dart';

class HotelPage extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(
      name: 'Hotel A',
      description:
          'Deskripsi Hotel A. Fasilitas lengkap dengan pemandangan indah.',
      imagePath: 'assets/images/hotel1.jpg',
      rating: 4.5,
      location: 'Kota A',
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      description:
          'Deskripsi Hotel B. Pengalaman menginap yang nyaman dan mewah.',
      imagePath: 'assets/images/hotel1.jpg',
      rating: 4.0,
      location: 'Kota B',
      price: 120.0,
    ),
    Hotel(
      name: 'Hotel C',
      description:
          'Deskripsi Hotel C. Pengalaman menginap yang istimewa.',
      imagePath: 'assets/images/hotel1.jpg',
      rating: 4.8,
      location: 'Kota C',
      price: 180.0,
    ),
    // Tambahkan hotel lainnya sesuai kebutuhan
  ];

  List<Hotel> _getBestHotels() {
    // Logika pemfilteran untuk mendapatkan hotel terbaik
    List<Hotel> bestHotels = hotels.where((hotel) => hotel.rating >= 4.5).toList();
    return bestHotels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Hotel'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _getBestHotels().length,
        itemBuilder: (context, index) {
          return HotelCard(hotel: _getBestHotels()[index]);
        },
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hotel.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  hotel.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating: ${hotel.rating}',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Lokasi: ${hotel.location}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga: \$${hotel.price.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Aksi yang diambil ketika tombol pemesanan ditekan
                        // Misalnya, membuka halaman pemesanan atau memberikan notifikasi
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Pesan Sekarang',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
