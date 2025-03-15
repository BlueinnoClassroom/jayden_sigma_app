import 'package:flutter/material.dart';
import 'package:sigma_app/screens/pkm_tcg_screen.dart';

class SurvivalScreen extends StatefulWidget {
  const SurvivalScreen({super.key});

  @override
  State<SurvivalScreen> createState() => _SurvivalScreenState();
}

class _SurvivalScreenState extends State<SurvivalScreen> {
  var wallet = 100.00;

  @override
  Widget build(BuildContext context) {
    final packs = [
      (
        'Base',
        70,
        'https://cc-client-assets.nyc3.cdn.digitaloceanspaces.com/photo/collectorscache/file/0b3349f0555211e89b154f403011cb11/base%20set%20charizard.jpg'
      ),
      (
        'Black & White',
        50,
        'https://m.media-amazon.com/images/I/71LZgYZTr-L.jpg'
      ),
      (
        'Colosseum',
        50,
        'https://archives.bulbagarden.net/media/upload/thumb/2/25/Colosseum_EN_boxart.png/250px-Colosseum_EN_boxart.png'
      ),
      (
        'Diamond & Pearl',
        40,
        'https://storage.googleapis.com/images.pricecharting.com/d7bc1dee360a08f332423ba648f8eecb27d51f46bba3a02863158b0e6e29f1a8/1600.jpg'
      ),
      (
        'E-Card',
        10,
        'https://loosepacks.com/cdn/shop/files/Untitled-1_75_590x590.png?v=1738787657'
      ),
      (
        'Ex',
        40,
        'https://tcgplayer-cdn.tcgplayer.com/product/565245_in_1000x1000.jpg'
      ),
      (
        'Gym',
        20,
        'https://tools.toywiz.com/_images/_webp/_products/lg/ampokgymchal1st.webp'
      ),
      (
        'HeartGold and SoulSilver',
        30,
        'https://i.ebayimg.com/images/g/WFsAAOSw7mhebZHB/s-l1200.jpg'
      ),
      (
        'Neo Genesis',
        50,
        'https://tcgplayer-cdn.tcgplayer.com/product/138142_in_1000x1000.jpg'
      ),
      (
        'Platinum',
        50,
        'https://m.media-amazon.com/images/I/717c7HvT9OL._AC_UF1000,1000_QL80_.jpg'
      ),
      (
        'Sun & Moon',
        30,
        'https://i5.walmartimages.com/seo/Pokemon-Sun-Moon-SM1-Booster-Pack-Lunala_324ef300-9c40-49a3-9b3b-f4acb8e1dfcc.d0b3d15db3b2ebfd777f8ca55a319f46.png'
      ),
      (
        'Sword & Shield',
        20,
        'https://m.media-amazon.com/images/I/61tQ+TAjYoL._AC_UF894,1000_QL80_.jpg'
      ),
      (
        'XY',
        50,
        'https://m.media-amazon.com/images/I/71Ax+NvhZCL._AC_UF894,1000_QL80_.jpg'
      ),
    ];
    final SellingPriceList = {
      'Common': 1.0,
      'Uncommon': 1.0,
      'Rare': 5.0,
      'Rare Holo': 10.00,
      'Rare Holo Ex': 15.00,
      'Rare Ultra': 20.00,
      'Rare Secret': 50.00,
      'Rare BREAK': 70.00
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Gambling"),
        actions: [
          Text('\$$wallet'),
          SizedBox(width: 16),
        ],
      ),
      body: GridView.builder(
          itemCount: 12,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            final pack = packs[index];
            final name = pack.$1;
            final price = pack.$2;
            final imgUrl = pack.$3;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('$name'), Text('\$$price')],
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (wallet - price < 0) {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            children: [
                              Center(
                                child: Text('u r broke'),
                              )
                            ],
                          ),
                        );

                        return;
                      }

                      wallet -= price;
                      setState(() {});

                      showDialog(
                        context: context,
                        builder: (context) => PkmTcgScreen(),
                      );
                    },
                    child: Image.network(imgUrl),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
