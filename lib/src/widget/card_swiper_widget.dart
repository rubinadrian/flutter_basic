import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatefulWidget {
  CardSwiper({Key key}) : super(key: key);

  @override
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: _createSwiper(),
    );
  }

  Widget _createSwiper() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
                        child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,), 
                        borderRadius: BorderRadius.circular(20.0),
                        );
          },
          layout: SwiperLayout.STACK,
          itemCount: 3,
          itemWidth: 150,
          itemHeight: 250
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
      ),
    );
  }

}