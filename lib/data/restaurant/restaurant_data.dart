import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/models/restaurant/restaurant_model.dart';

List<Restaurant> restaurants = [
  Restaurant(
    id: '1',
    name: 'Bebek Tepi Sawah',
    imageUrl:
        'https://www.water-sport-bali.com/wp-content/uploads/2012/10/Bebek-Tepi-Sawah-Restoran-Di-Ubud-Facebook.jpg',
    address: 'Jl. Raya Goa Gajah, Br. Teges, Peliatan, Ubud, Bali',
    location: const LatLng(-8.527717, 115.263098),
    rating: 3.5,
    menus: [
      Menu(
          name: 'Bebek Goreng Krispi',
          price: 75.000,
          imageUrl:
              'https://media-cdn.tripadvisor.com/media/photo-s/11/13/1b/be/grilled-duck.jpg'),
      Menu(
          name: 'Sate Lilit',
          price: 40.000,
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/6/6d/Sate_lilit.jpg'),
      Menu(
          name: 'Bebek Goreng Krispi',
          price: 75.000,
          imageUrl:
              'https://media-cdn.tripadvisor.com/media/photo-s/11/13/1b/be/grilled-duck.jpg'),
      Menu(
          name: 'Sate Lilit',
          price: 40.000,
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/6/6d/Sate_lilit.jpg'),
    ],
  ),
  Restaurant(
    id: '2',
    name: 'Warung Nasi Ampera',
    imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgFcAB2tX8K2voOW6et4RAsoJojbEDyYmUKnGRPK1V1hPHuTGBX7aT9ZiTi45RSrieuCFzT5y4K1s2mH9G3cqpeninBO_mbFV84KV4BKu52oZoAQ4ZDBMRO3T-eHwHMa3x0epjiHXo5gT0o-0IgipHt5P1P3qqrFVTa4vad6G5Jg0y5KmkAUqseGU0JMg/s750/ampera.jpg',
    address: 'Jl. Sultan Agung No.8, Jakarta',
    location: const LatLng(-6.214620, 106.845130),
    rating: 4.0,
    menus: [
      Menu(
          name: 'Rendang',
          price: 30.000,
          imageUrl:
              'https://cdn0-production-images-kly.akamaized.net/vIx_lxR1UfFl79d67T7pjvy1tXw=/800x450/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1253731/original/213c98558a7233f0f923c91df2b986f9beef-curry-recipe-stew-beef-in-coconut-curry.jpg'),
      Menu(
          name: 'Ayam Pop',
          price: 28.000,
          imageUrl:
              'https://www.piknikdong.com/wp-content/uploads/2022/09/Resep-Ayam-Pop-Padang-Sederhana.jpg'),
      Menu(
          name: 'Rendang',
          price: 30.000,
          imageUrl:
              'https://cdn0-production-images-kly.akamaized.net/vIx_lxR1UfFl79d67T7pjvy1tXw=/800x450/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1253731/original/213c98558a7233f0f923c91df2b986f9beef-curry-recipe-stew-beef-in-coconut-curry.jpg'),
      Menu(
          name: 'Ayam Pop',
          price: 28.000,
          imageUrl:
              'https://www.piknikdong.com/wp-content/uploads/2022/09/Resep-Ayam-Pop-Padang-Sederhana.jpg'),
    ],
  ),
  Restaurant(
    id: '3',
    name: 'Sate Maranggi Cibungur',
    imageUrl:
        'https://cdn-2.tstatic.net/jakarta/foto/bank/images/sate-maranggi-haji-yetty-cibunggur-purwakarta-cabang-cibubur.jpg',
    address: 'Jl. Raya Cibungur, Purwakarta',
    location: const LatLng(-6.556, 107.441),
    rating: 4.5,
    menus: [
      Menu(
          name: 'Sate Maranggi',
          price: 50.000,
          imageUrl:
              'https://2.bp.blogspot.com/-kolISglOKC4/XGOaQTObb8I/AAAAAAAAEAA/h2OCaH3EfosAdLjgGa2gAwXLyg6_6iNtQCLcBGAs/s1600/Sate%2BMaranggi%2Bcibungur.jpg'),
      Menu(
          name: 'Empal Gentong',
          price: 35.000,
          imageUrl:
              'https://img-global.cpcdn.com/recipes/a16d2e480f7795bb/400x400cq70/photo.jpg'),
      Menu(
          name: 'Sate Maranggi',
          price: 50.000,
          imageUrl:
              'https://2.bp.blogspot.com/-kolISglOKC4/XGOaQTObb8I/AAAAAAAAEAA/h2OCaH3EfosAdLjgGa2gAwXLyg6_6iNtQCLcBGAs/s1600/Sate%2BMaranggi%2Bcibungur.jpg'),
      Menu(
          name: 'Empal Gentong',
          price: 35.000,
          imageUrl:
              'https://img-global.cpcdn.com/recipes/a16d2e480f7795bb/400x400cq70/photo.jpg'),
    ],
  ),
  Restaurant(
    id: '4',
    name: 'Soto Lamongan Cak Har',
    imageUrl:
        'https://asset-2.tstatic.net/jateng/foto/bank/images/Ellen-kiri-dan-Yessica-tengah-pemilik-resto-Soto-Cak-Har-di-Semarangnghhj5787.jpg',
    address: 'Jl. Mangga Besar, Jakarta',
    location: const LatLng(-6.145, 106.826),
    rating: 3.0,
    menus: [
      Menu(
          name: 'Soto Ayam',
          price: 25.000,
          imageUrl:
              'https://cdns.klimg.com/merdeka.com/i/w/news/2021/09/16/1353423/540x270/rahasia-soto-lamongan-yang-jarang-diketahui-ada-cara-khusus-bikin-koya.jpeg'),
      Menu(
          name: 'Soto Daging',
          price: 30.000,
          imageUrl:
              'https://resepkoki.id/wp-content/uploads/2016/04/Resep-Soto-kuning-bogor.jpg'),
      Menu(
          name: 'Soto Ayam',
          price: 25.000,
          imageUrl:
              'https://cdns.klimg.com/merdeka.com/i/w/news/2021/09/16/1353423/540x270/rahasia-soto-lamongan-yang-jarang-diketahui-ada-cara-khusus-bikin-koya.jpeg'),
      Menu(
          name: 'Soto Daging',
          price: 30.000,
          imageUrl:
              'https://resepkoki.id/wp-content/uploads/2016/04/Resep-Soto-kuning-bogor.jpg'),
    ],
  ),
  Restaurant(
    id: '5',
    name: 'Ayam Goreng Suharti',
    imageUrl:
        'https://www.infobumi.com/wp-content/uploads/2021/09/20210915_235044-scaled.jpg',
    address: 'Jl. Laksda Adisucipto, Yogyakarta',
    location: const LatLng(-7.782, 110.365),
    rating: 5.0,
    menus: [
      Menu(
          name: 'Ayam Goreng',
          price: 40.000,
          imageUrl:
              'https://asset-2.tstatic.net/jateng/foto/bank/images/ayam-suharti-travel.jpg'),
      Menu(
          name: 'Tahu Telor',
          price: 20.000,
          imageUrl:
              'https://asset.kompas.com/crops/iKY5hESYh8L5CCu101WTKUhAhQE=/3x0:700x465/750x500/data/photo/2022/04/03/624965d1dc93d.jpg'),
      Menu(
          name: 'Ayam Goreng',
          price: 40.000,
          imageUrl:
              'https://asset-2.tstatic.net/jateng/foto/bank/images/ayam-suharti-travel.jpg'),
      Menu(
          name: 'Tahu Telor',
          price: 20.000,
          imageUrl:
              'https://asset.kompas.com/crops/iKY5hESYh8L5CCu101WTKUhAhQE=/3x0:700x465/750x500/data/photo/2022/04/03/624965d1dc93d.jpg'),
    ],
  ),
];
