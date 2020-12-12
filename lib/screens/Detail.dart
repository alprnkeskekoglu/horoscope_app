import 'package:flutter/material.dart';
import 'package:horoscope_app/screens/homepage.dart';


class Detail extends StatelessWidget {

  var horoscope;
  Detail(this.horoscope);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/sky.jpg"), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.white.withOpacity(.4), BlendMode.dstATop)),
          color: Colors.black

        ),
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              primary: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(horoscope['image'], fit: BoxFit.cover,),
                title: Text(horoscope['name']),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                child: Column(
                  children: getSingeLine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getSingeLine() {
    List<Widget> list = [];

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Tarih:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['date'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );


    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Element:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['element'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Gezegen:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['planet'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Renk:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Expanded(child: Text(horoscope['color'], style: TextStyle(color: Colors.white, fontSize: 20),))
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Taş:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['stone'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Gün:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['day'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('İyi Anlaştıkları:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['good_with'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text('Kötü Anlaştıkları:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text(horoscope['bad_with'], style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      )
    );

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Text('Özellikleri:  ', style: TextStyle(color: Colors.white, fontSize: 20),),
            Expanded(child: Text(horoscope['properties'], style: TextStyle(color: Colors.white, fontSize: 20),))
          ],
        ),
      )
    );

    return list;
  }
}
