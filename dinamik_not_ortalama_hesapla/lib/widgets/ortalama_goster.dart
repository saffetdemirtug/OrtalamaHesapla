import 'package:dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:flutter/material.dart';


class OrtalamaGoster extends StatelessWidget {
  
   double ortalama = 1;
   int dersSayisi = 1;

   OrtalamaGoster(
    {required this.dersSayisi, required this.ortalama, super.key});

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seçiniz",
          style: Sabitler.ortalamaStringStyle,
        ),
        Text(ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
            style: Sabitler.ortalamaDoubleStyle),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaStringStyle,
        ),
      ],
    );
  }
}
