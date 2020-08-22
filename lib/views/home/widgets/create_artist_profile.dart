import 'package:arties_flutter_prototype/views/widgets/arties_button.dart';
import 'package:flutter/material.dart';

class CreateArtistProfile extends StatelessWidget {
  const CreateArtistProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "¿Sos artista?",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 25
            ),
          ),
          Text(
            "¡Configurá ahora mismo tu perfil de artista y empezá a publicar tu trabajo!",
            textAlign: TextAlign.center,  
          ),
          SizedBox(
            height: 10,
          ),
          ArtiesButton(
            text: "Empezar",
            onPressed: (){}
          )
        ],
      ),
    );
  }
}