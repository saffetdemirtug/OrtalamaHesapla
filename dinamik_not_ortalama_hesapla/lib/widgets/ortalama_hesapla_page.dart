import 'package:dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesapla/helper/data_helper.dart';
import 'package:dinamik_not_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_not_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_not_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_not_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKredi = 1;
  String girilenDersAdi = " ";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0, //Transparent appbar elde etmek için kullanıldı.
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Sabitler.appBarText,
            style: Sabitler.appBarStyle,
          ),
        ),
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            verticalDirection: VerticalDirection.up,
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla()))
            ],
          ),
          Expanded(child: DersListesi(
            onElemanCikar: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {});
            },
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKredi = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? true) {
                    formKey.currentState?.save();
                    var eklenecekDers = Ders(
                        ad: girilenDersAdi,
                        harfDegeri: secilenHarfDegeri,
                        krediDegeri: secilenKredi);

                    DataHelper.dersEkle(eklenecekDers);

                    setState(() {});
                  }
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
                color: Sabitler.anaRenk,
                iconSize: 35,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders adını giriniz.";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        
        filled: true,
        fillColor: Sabitler.anaRenk.shade200.withOpacity(0.3),
        hintText: "Ders Adı",
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
      ),
    );
  }
}
