import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doa/doa_lib/const_path.dart';
import 'package:doa/doa_lib/enum.dart';
import 'package:doa/doa_lib/routes.dart';
import 'package:doa/doa_lib/style/colors.dart';
import 'package:doa/doa_lib/style/textstyle.dart';
import 'package:doa/doa_lib/widget/widgets.dart';

class OpeningAccount extends StatelessWidget {
  const OpeningAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
      appBar: APPBAR(
          onPressed: () => Get.back(),
          title: OpeningAccountWord.bukaRekening.text),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 52),
              Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: PINK_LIGHT),
                  child: IMAGE_ASSET(openingAccountAssets)),
              const SizedBox(height: 24),
              Text(OpeningAccountWord.ayoBukaTabungan.text,
                  style: textStyleW600(fontSize: 16),
                  textAlign: TextAlign.center),
              Text(OpeningAccountWord.jikaAndaSudahMempunyai.text,
                  style: textStyleW500(fontSize: 14),
                  textAlign: TextAlign.center),
              const SizedBox(height: 58),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  color: BLUE_LIGHT,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageIcon(ASSET_IMAGE(lampAssets),
                                color: BLUE_TEXT),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        OpeningAccountWord
                                            .untukKelancaranPembukaan.text,
                                        style: textStyleW600(
                                            fontSize: 12,
                                            fontColor: BLUE_TEXT)),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text:
                                              OpeningAccountWord.eKtpWajib.text,
                                          style: textStyleW600(
                                              fontSize: 12,
                                              fontColor: BLUE_TEXT)),
                                    ])),
                                  ]),
                            )
                          ])))
            ])),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
        child: BUTTON(
            radiusCircular: 999,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                OpeningAccountWord.lanjut.text,
                style: textStyleW600(fontSize: 16, fontColor: Colors.white),
              ),
            ),
            onPressed: () async => await Get.toNamed(ROUTE.openingTnc.name)),
      ),
    ));
  }
}
