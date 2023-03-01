import 'package:dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesapla/helper/data_helper.dart';
import 'package:dinamik_not_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikar;
  const DersListesi({required this.onElemanCikar, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;

    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikar(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        tumDersler[index].ad,
                        style: Sabitler.textKalinlik,
                      ),
                      leading: CircleAvatar(
                          backgroundColor: Sabitler.anaRenk.shade400,
                          child: Text(
                            (tumDersler[index].harfDegeri *
                                    tumDersler[index].krediDegeri)
                                .toString(),
                          )),
                      subtitle: Text(
                        "${tumDersler[index].krediDegeri} Kredi,Not Değeri ${tumDersler[index].harfDegeri}",
                        style: Sabitler.textKalinlik,
                      ),
                    ),
                  ),
                ),
              );
              // ignore: avoid_unnecessary_containers
            })
        : Center(
            child: Container(
              child: Text("Lütfen ders ekleyin.", style: Sabitler.appBarStyle),
            ),
          );
  }
}
