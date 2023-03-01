import 'package:dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;

  const KrediDropdownWidget({required this.onKrediSecildi, super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKredi = 1;
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
        value: secilenKredi,
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger!;
            widget.onKrediSecildi(deger);
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
