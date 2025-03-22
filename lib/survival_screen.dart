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
        'https://cc-client-assets.nyc3.cdn.digitaloceanspaces.com/photo/collectorscache/file/0b3349f0555211e89b154f403011cb11/base%20set%20charizard.jpg',
        [
          'base1',
          'base2',
          'base3',
          'base4',
          'base5',
          'base6',
          'basep',
        ]
      ),
      (
        'Black & White',
        50,
        'https://m.media-amazon.com/images/I/71LZgYZTr-L.jpg',
        [
          'bw1',
          'bw2',
          'bw3',
          'bw4',
          'bw5',
          'bw6',
          'bw7',
          'bw8',
          'bw9',
          'bw10',
          'bw11',
          'bwp',
        ]
      ),
      (
        'Colosseum',
        50,
        'https://lens.usercontent.google.com/image?vsrid=COadxd7ru630AhACGAEiJGE2MjY4ODJmLTFjM2UtNDE2NS1hOTM4LTRjZjg0M2RkMjE4Ng&gsessionid=kASkypyhmv4XBy4MFcQPh3JaVATp3Jf4mwo2UYiw1csICh_w5dFz6Q',
        ['dp1', 'dp2', 'dp3', 'dp4', 'dp5', 'dp6', 'dp7', 'dpp']
      ),
      (
        'Diamond & Pearl',
        40,
        'https://storage.googleapis.com/images.pricecharting.com/d7bc1dee360a08f332423ba648f8eecb27d51f46bba3a02863158b0e6e29f1a8/1600.jpg',
        ['col1', 'cel25', 'cel25c']
      ),
      (
        'E-Card',
        10,
        'https://loosepacks.com/cdn/shop/files/Untitled-1_75_590x590.png?v=1738787657',
        ['ecard1', 'ecard2', 'ecard3']
      ),
      (
        'Ex',
        40,
        'https://tcgplayer-cdn.tcgplayer.com/product/565245_in_1000x1000.jpg',
        [
          'ex1',
          'ex2',
          'ex3',
          'ex4',
          'ex5',
          'ex6',
          'ex7',
          'ex8',
          'ex9',
          'ex10',
          'ex11',
          'ex12',
          'ex13',
          'ex14',
          'ex15',
          'ex16',
        ]
      ),
      (
        'Gym',
        20,
        'https://tools.toywiz.com/_images/_webp/_products/lg/ampokgymchal1st.webp',
        [
          'gym1',
          'gym2',
        ]
      ),
      (
        'HeartGold and SoulSilver',
        30,
        'https://i.ebayimg.com/images/g/WFsAAOSw7mhebZHB/s-l1200.jpg',
        [
          'hgss1',
          'hgss2',
          'hgss3',
          'hgss4',
          'hsp',
        ]
      ),
      (
        'Neo Genesis',
        50,
        'https://tcgplayer-cdn.tcgplayer.com/product/138142_in_1000x1000.jpg',
        [
          'neo1',
          'neo2',
          'neo3',
          'neo4',
          'neop',
        ]
      ),
      (
        'Platinum',
        50,
        'https://m.media-amazon.com/images/I/717c7HvT9OL._AC_UF1000,1000_QL80_.jpg',
        [
          'pl1',
          'pl2',
          'pl3',
          'pl4',
        ]
      ),
      (
        'Sun & Moon',
        30,
        'https://i5.walmartimages.com/seo/Pokemon-Sun-Moon-SM1-Booster-Pack-Lunala_324ef300-9c40-49a3-9b3b-f4acb8e1dfcc.d0b3d15db3b2ebfd777f8ca55a319f46.png',
        [
          'sm1',
          'sm2',
          'sm3',
          'sm4',
          'sm5',
          'sm6',
          'sm7',
          'sm8',
          'sm9',
          'sm10',
          'sm11',
          'sm12',
          'sm35',
          'sm75',
          'sm115',
          'sma',
          'smp'
        ]
      ),
      (
        'Sword & Shield',
        20,
        'https://m.media-amazon.com/images/I/61tQ+TAjYoL._AC_UF894,1000_QL80_.jpg',
        [
          'swsh1',
          'swsh2',
          'swsh3',
          'swsh4',
          'swsh5',
          'swsh6',
          'swsh7',
          'swsh8',
          'swsh9',
          'swsh9tg',
          'swsh10',
          'swsh10tg',
          'swsh11',
          'swsh11tg',
          'swsh12',
          'swsh12pt5',
          'swsh12pt5gg',
          'swsh12tg',
          'swsh35',
          'swsh45',
          'swsh45sv',
          'swshp'
        ]
      ),
      (
        'XY',
        50,
        'https://m.media-amazon.com/images/I/71Ax+NvhZCL._AC_UF894,1000_QL80_.jpg',
        [
          'xy0',
          'xy1',
          'xy2',
          'xy3',
          'xy4',
          'xy5',
          'xy6',
          'xy7',
          'xy8',
          'xy9',
          'xy10',
          'xy11',
          'xy12',
          'xyp'
        ]
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
                        builder: (context) => PkmTcgScreen(
                            packPaths: pack.$4,
                            onDraw: (totalValue) {
                              wallet += totalValue;
                              setState(() {});
                            }),
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
