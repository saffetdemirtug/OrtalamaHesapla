import 'package:dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi, super.key});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        borderRadius: Sabitler.borderRadius,
        color: Sabitler.anaRenk.withOpacity(0.3),
        //gradient: LinearGradient(colors: Sabitler.googleRenk)
      ),
      child: DropdownButton<double>(
        iconEnabledColor: Sabitler.anaRenk.shade900,
        elevation: 16,
        underline: Container(),
        value: secilenHarfDegeri,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
