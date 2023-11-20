import 'package:digimon_2324/footballer_model.dart';
import 'footballer_detail_page.dart';
import 'package:flutter/material.dart';


class FootballerCard extends StatefulWidget {
  final Footballer footballer;

  const FootballerCard(this.footballer, {super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _FootballerCardState createState() => _FootballerCardState(footballer);
}

class _FootballerCardState extends State<FootballerCard> {
  Footballer footballer;
  String? renderUrl;

  _FootballerCardState(this.footballer);

  @override
  void initState() {
    super.initState();
    renderFootballerPic();
  }

  Widget get footballerImage {
    var footballerAvatar = Hero(
      tag: footballer,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.black54, Colors.black, Color.fromARGB(255, 84, 110, 122)])),
      alignment: Alignment.center,
      child: const Text(
        'FTBL',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: footballerAvatar,
      // ignore: unnecessary_null_comparison
      crossFadeState: renderUrl == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderFootballerPic() async {
    await footballer.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = footballer.imageUrl;
      });
    }
  }

  Widget get footballerCard {
    return Positioned(
      right: 0.0,
      child: SizedBox(
        width: 290,
        height: 115,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Color(0xFFF8F8F8),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.footballer.name,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 27.0),
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.star, color: Color.fromARGB(255, 238, 255, 0)),
                    Text(': ${widget.footballer.rating}/10', style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showFootballerDetailPage() async {
    var updatedRating = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return FootballerDetailPage(footballer);
    }));

    if (updatedRating != null) {
      setState(() {
        widget.footballer.rating = updatedRating;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showFootballerDetailPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              footballerCard,
              Positioned(top: 7.5, child: footballerImage),
            ],
          ),
        ),
      ),
    );
  }
}
