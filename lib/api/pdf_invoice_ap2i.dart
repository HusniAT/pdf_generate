import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:generate_pdf_invoice_example/api/pdf_api.dart';
import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:generate_pdf_invoice_example/model/invoice.dart';
import 'package:generate_pdf_invoice_example/model/supplier.dart';
import 'package:generate_pdf_invoice_example/utils.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'dart:convert' show utf8;

//import 'package:google_fonts/google_fonts.dart';

class PdfInvoiceApi2 {


  static Future<File> generate2(Invoice2 invoice2) async {

    var arabicFont = Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));
    var pdf2 = Document();
    pdf2.addPage(
        MultiPage(pageFormat: PdfPageFormat.a4,
        theme: ThemeData.withFont(
          base: arabicFont,
        ),

      build: (context) => [
        buildTopHeader(),
        pw.SizedBox(height: 12,),
        buildHeader(invoice2),

/////////////////////////////////////////////
        Divider(
          height: 2,
          thickness: 2,
        ),
        pw.SizedBox(height: 20,),
        pw.Directionality(
            textDirection:pw.TextDirection.rtl,
          child: buildTable(invoice2),
        ),
        pw.SizedBox(height: 20,),

       // buildTable(invoice2),
        //pw.SizedBox(height: 320,),
 /////////////////////////////////////////
        Divider(
          height: 2,
          thickness: 2,
        ),
        buildFooter(invoice2),
      ],
    ));
    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf2);
  }

  static pw.Widget buildTopHeader() => pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.SizedBox(height: PdfPageFormat.cm* 0.51,),
      pw.Center(
          child: pw.Text(
              "فاتورة مبيعات",
              textDirection: pw.TextDirection.rtl,
              style: pw.TextStyle(
                fontSize: 40,
                color: PdfColor.fromHex("#222b43"),
              )
          )),
      pw.SizedBox(height: PdfPageFormat.cm* 0.51,),
      Divider(
        height: 2,
        thickness: 2,
      ),

    ],
  );

  static pw.Widget buildHeader(Invoice2 invoice2) => pw.Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Directionality(
            textDirection:pw.TextDirection.ltr ,
            child: pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 18.0, vertical: 1),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [

                      pw.Text(
                        invoice2.header.clientName,
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#222b43"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      pw.SizedBox(width: 12,),

                      pw.Text(
                        "اسم العميل" + ' : ',
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#252426"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),


                    ]

                )
            ),
          ),
          pw.SizedBox(height: 12,),

          pw.Directionality(
            textDirection:pw.TextDirection.ltr ,
            child: pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 18.0, vertical: 1),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [

                      pw.Text(
                        invoice2.header.Date,
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#222b43"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      pw.SizedBox(width: 12,),

                      pw.Text(
                        "تاريخ الطباعة " + ' : ',
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#252426"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),


                    ]

                )
            ),
          ),
          pw.SizedBox(height: 12,),

          pw.Directionality(
            textDirection:pw.TextDirection.ltr ,
            child: pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 18.0, vertical: 1),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [

                      pw.Text(
                        invoice2.header.OrderNum,
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#222b43"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      pw.SizedBox(width: 12,),

                      pw.Text(
                        "رقم الفاتورة " + ' : ',
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#252426"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),


                    ]

                )
            ),
          ),

          pw.SizedBox(height: 12,),

          pw.Directionality(
            textDirection:pw.TextDirection.ltr ,
            child: pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 18.0, vertical: 1),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [

                      pw.Text(
                        invoice2.header.sellerName,
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#222b43"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      pw.SizedBox(width: 12,),

                      pw.Text(
                        "البائع" + ' : ',
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#252426"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),


                    ]

                )
            ),
          ),
        ],
      );


  static pw.Widget buildTable(Invoice2 invoice2) {
    final headers = [
      'المجموع',
      'السعر',
      'الكمية',
      'المادة',
      // 'VAT',
      // 'Total'
    ];
    final data = invoice2.items.map((item) {
      final total = item.ProductPrice * item.ProductQuantity ;

      return [


        item.ProductPrice * item.ProductQuantity,
        item.ProductPrice,
        item.ProductQuantity,

        item.ProductName,
        // Utils.formatDate(item.date),
        // '${item.quantity}',
        //  '\$ ${item.unitPrice}',
        //  '${item.vat} %',
        //  '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return pw.Table.fromTextArray(
      headers: headers,
      data: data,
      border:  pw.TableBorder(
        left: pw.BorderSide(width: 2, color: PdfColor.fromHex("#222b43"), style: pw.BorderStyle.solid),
        right: pw.BorderSide(width: 2, color: PdfColor.fromHex("#222b43"), style: pw.BorderStyle.solid),
        verticalInside: pw.BorderSide(width: 1, color: PdfColor.fromHex("#6c7b8b"), style: pw.BorderStyle.solid),
        horizontalInside: pw.BorderSide(width: 1, color: PdfColor.fromHex("#003153"), style: pw.BorderStyle.solid),

      ),
      headerStyle: pw.TextStyle(fontWeight: FontWeight.normal),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      headerAlignment: pw.Alignment.center,
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
       // 4: pw.Alignment.centerRight,
       // 5: pw.Alignment.centerRight,
      },
    );
  }

static pw.Widget buildFooter(Invoice2 invoice2) => pw.Column(


      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.SizedBox(height: 12,),
        pw.Directionality(
          textDirection:pw.TextDirection.ltr ,
          child: pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 18.0, vertical: 1),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [

                    pw.Text(
                      invoice2.footer.Discount,
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(
                          color: PdfColor.fromHex("#FF0000"),
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    pw.SizedBox(width: 120,),

                    pw.Text(
                      "الخصم" + ' : ',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(
                          color: PdfColor.fromHex("#252426"),
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                    ),


                  ]

              )
          ),
        ),
        pw.SizedBox(height: 12,),
        pw.Directionality(
          textDirection:pw.TextDirection.ltr ,
          child: pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 18.0, vertical: 1),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [

                    pw.Text(
                      invoice2.footer.netCost,
                      textDirection: pw.TextDirection.rtl,

                      style: pw.TextStyle(
                          color: PdfColor.fromHex("#222b43"),
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    pw.SizedBox(width: 80,),

                    pw.Text(
                      "صافي التكلفة " + ' : ',
                      textDirection: pw.TextDirection.rtl,

                      style: pw.TextStyle(
                          color: PdfColor.fromHex("#252426"),
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                    ),


                  ]

              )
          ),
        ),

      ],
    );

}
