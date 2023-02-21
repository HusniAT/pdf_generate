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

class PdfInvoiceApi {

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  static Future<File> generate(Invoice invoice) async {
   // final pdf = Document();

   // var data = await rootBundle.load("assets/OpenSans/OpenSans-Regular.ttf");
  //  final ttf = Font.ttf(data);
    //var myFont = Font.ttf(data);
   // var myStyle = TextStyle(font: myFont);
   //  var myTheme = ThemeData.withFont(
   //    base: Font.ttf(await rootBundle.load("assets/OpenSans/OpenSans-Regular.ttf")),
   //    bold: Font.ttf(await rootBundle.load("assets/OpenSans/OpenSans-Bold.ttf")),
   //    italic: Font.ttf(await rootBundle.load("assets/OpenSans/OpenSans-Italic.ttf")),
   //    boldItalic: Font.ttf(await rootBundle.load("assets/OpenSans/OpenSans-BoldItalic.ttf")),
   //  );

   // var encoded = utf8.encode('فاتورة مبيعات ');
   // var decoded = utf8.decode(encoded);

    var arabicFont = Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));


    var pdf2 = Document(
     // theme: myTheme,
    );


    //  final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf2.addPage(
        MultiPage(pageFormat: PdfPageFormat.a4,
        theme: ThemeData.withFont(
          base: arabicFont,
        ),

      build: (context) => [
       // buildHeader(invoice),
        pw.SizedBox(height: PdfPageFormat.cm* 0.51,),
       pw.Center(
           child: pw.Text(
              "فاتورة مبيعات",
              textDirection: pw.TextDirection.rtl,
              style: pw.TextStyle(
                fontSize: 40,
                color: PdfColor.fromHex("#222b43"),
              //   background: pw.BoxDecoration(
              //       color:PdfColor.fromHex("#222b43")
              //
              // ),

                // Paint()
                //   ..style = PaintingStyle.stroke
                //   ..strokeWidth = 3
                //   ..color = Colors.blue[700]!,
              )
              // style: TextStyle(
              //   fontSize: 40,
              //
              //   // foreground: Paint()
              //   //   ..style = PaintingStyle.stroke
              //   //   ..strokeWidth = 3
              //   //   ..color = Colors.blue[700]!,
              // ),

            )),

        ////////////////////////////////////
        pw.SizedBox(height: PdfPageFormat.cm* 0.51,),
        Divider(
          height: 2,
          thickness: 2,
        ),
        pw.SizedBox(height: 12,),

        buildHeader(invoice),

/////////////////////////////////////////////
        Divider(
          height: 2,
          thickness: 2,
        ),
        pw.SizedBox(height: 320,),

        /////////////////////////////////////////
        Divider(
          height: 2,
          thickness: 2,
        ),

        buildFooter(invoice),




        /////////////////////////////////////
        // pw.Directionality(
        //   textDirection: pw.TextDirection.rtl,
        //   child: pw.Padding(
        //     padding: const pw.EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
        //     child: pw.Row(
        //         children: [
        //           pw.Text(
        //             " 20 % ",
        //             textDirection: pw.TextDirection.rtl,
        //
        //             style: pw.TextStyle(
        //               color: PdfColor.fromHex("#222b43"),
        //               fontSize: 15,
        //               fontWeight: FontWeight.bold,
        //
        //             ),
        //           ),
        //           pw.SizedBox(width: 2,),
        //
        //           pw.Text(
        //             "حسني    : ",
        //             textDirection: pw.TextDirection.rtl,
        //             style: pw.TextStyle(
        //                 color: PdfColor.fromHex("#252426"),
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold
        //             ),
        //           ),
        //         ]
        //     ),
        //   ),
        // )


        //////////////




        // pw.Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  الفرع الأول ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('الفرع : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        //
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  01231324234  ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('الرقم الضريبي : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  حي الخليج - الرياض ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('الموقع : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        //
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  0123456789 ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('هاتف : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  1  ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('رقم الفاتورة : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  خالد  ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('اسم العميل : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        //
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  0506040215 ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('رقم هاتف العميل : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        //
        // Directionality(
        //     textDirection: TextDirection.rtl,
        //     child: Text('المشتريات' , style: TextStyle(
        //         fontSize: 10
        //     ))
        // ),
        // Container(
        //   margin: EdgeInsets.fromLTRB(22, 5, 22, 5),
        //   child: Directionality(
        //     textDirection: TextDirection.rtl,
        //     child: Table.fromTextArray(
        //       headerStyle: TextStyle(
        //           fontSize: 6
        //       ),
        //       headers: <dynamic>['الإجمالي', 'العدد' ,'الخدمة', 'القطعة'],
        //       cellAlignment: Alignment.center,
        //       cellStyle: TextStyle(
        //           fontSize: 5
        //       ),
        //       data:  <List<dynamic>>[
        //         <dynamic>['50', '10' ,'كوي', 'قميص' ],
        //       ],
        //     ),
        //   ),
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  50  ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('المجموع الفرعي : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  -20  ',
        //                   style: TextStyle(
        //                     fontSize: 10,
        //                   ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('خصم العميل : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  1  ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('خصم عددي : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  29  ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('الإجمالي : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  مدفوعة  ',
        //                   style: TextStyle(
        //                     fontSize: 10,
        //                   ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('حالة الفاتورة : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text(
        //                   '  نقدا  ',
        //                   style: TextStyle(
        //                     fontSize: 10,
        //                   ))
        //           )
        //       ),
        //       Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Center(
        //               child: Text('طريقة الدفع : ', style: TextStyle(
        //                 fontSize: 10,
        //               ))
        //           )
        //       ),
        //     ]
        // ),
        // SizedBox(height: 3 * PdfPageFormat.cm),
        // buildTitle(invoice),
         buildInvoice(invoice),
        // Divider(),
        // buildTotal(invoice),
      ],
    //  footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf2);
  }

  // static Widget buildHeader(Invoice invoice) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(height: 1 * PdfPageFormat.cm),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             buildSupplierAddress(invoice.supplier),
  //             Container(
  //               height: 50,
  //               width: 50,
  //               child: BarcodeWidget(
  //                 barcode: Barcode.qrCode(),
  //                 data: invoice.info.number,
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 1 * PdfPageFormat.cm),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             buildCustomerAddress(invoice.customer),
  //             buildInvoiceInfo(invoice.info),
  //           ],
  //         ),
  //       ],
  //     );
  //
  // static Widget buildCustomerAddress(Customer customer) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
  //         Text(customer.address),
  //       ],
  //     );
  //
  // static Widget buildInvoiceInfo(InvoiceInfo info) {
  //   final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
  //   final titles = <String>[
  //     'Invoice Number:',
  //     'Invoice Date:',
  //     'Payment Terms:',
  //     'Due Date:'
  //   ];
  //   final data = <String>[
  //     info.number,
  //     Utils.formatDate(info.date),
  //     paymentTerms,
  //     Utils.formatDate(info.dueDate),
  //   ];
  //
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: List.generate(titles.length, (index) {
  //       final title = titles[index];
  //       final value = data[index];
  //
  //       return buildText(title: title, value: value, width: 200);
  //     }),
  //   );
  // }
  //
  // static Widget buildSupplierAddress(Supplier supplier) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
  //         SizedBox(height: 1 * PdfPageFormat.mm),
  //         Text(supplier.address),
  //       ],
  //     );
  //
  // static Widget buildTitle(Invoice invoice) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'INVOICE',
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(height: 0.8 * PdfPageFormat.cm),
  //         Text(invoice.info.description),
  //         SizedBox(height: 0.8 * PdfPageFormat.cm),
  //       ],
  //     );
  //
  static pw.Widget buildInvoice(Invoice invoice) {
    final headers = [
      'Description',
      'Date',
      'Quantity',
      'Unit Price',
      'VAT',
      'Total'
    ];
    final data = invoice.items.map((item) {
      final total = item.unitPrice * item.quantity * (1 + item.vat);

      return [
        item.description,
        Utils.formatDate(item.date),
        '${item.quantity}',
        '\$ ${item.unitPrice}',
        '${item.vat} %',
        '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return pw.Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: pw.TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerRight,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.centerRight,
        5: pw.Alignment.centerRight,
      },
    );
  }
  //
  // static Widget buildTotal(Invoice invoice) {
  //   final netTotal = invoice.items
  //       .map((item) => item.unitPrice * item.quantity)
  //       .reduce((item1, item2) => item1 + item2);
  //   final vatPercent = invoice.items.first.vat;
  //   final vat = netTotal * vatPercent;
  //   final total = netTotal + vat;
  //
  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: Row(
  //       children: [
  //         Spacer(flex: 6),
  //         Expanded(
  //           flex: 4,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               buildText(
  //                 title: 'Net total',
  //                 value: Utils.formatPrice(netTotal),
  //                 unite: true,
  //               ),
  //               buildText(
  //                 title: 'Vat ${vatPercent * 100} %',
  //                 value: Utils.formatPrice(vat),
  //                 unite: true,
  //               ),
  //               Divider(),
  //               buildText(
  //                 title: 'Total amount due',
  //                 titleStyle: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //                 value: Utils.formatPrice(total),
  //                 unite: true,
  //               ),
  //               SizedBox(height: 2 * PdfPageFormat.mm),
  //               Container(height: 1, color: PdfColors.grey400),
  //               SizedBox(height: 0.5 * PdfPageFormat.mm),
  //               Container(height: 1, color: PdfColors.grey400),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // static Widget buildFooter(Invoice invoice) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Divider(),
  //         SizedBox(height: 2 * PdfPageFormat.mm),
  //         buildSimpleText(title: 'Address', value: invoice.supplier.address),
  //         SizedBox(height: 1 * PdfPageFormat.mm),
  //         buildSimpleText(title: 'Paypal', value: invoice.supplier.paymentInfo),
  //       ],
  //     );

  // static buildSimpleText({
  //   required String title,
  //   required String value,
  // }) {
  //   final style = TextStyle(fontWeight: FontWeight.bold);
  //
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: pw.CrossAxisAlignment.end,
  //     children: [
  //       Text(title, style: style),
  //       SizedBox(width: 2 * PdfPageFormat.mm),
  //       Text(value),
  //     ],
  //   );
  // }
  //
  // static buildText({
  //   required String title,
  //   required String value,
  //   double width = double.infinity,
  //   TextStyle? titleStyle,
  //   bool unite = false,
  // }) {
  //   final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);
  //
  //   return Container(
  //     width: width,
  //     child: Row(
  //       children: [
  //         Expanded(child: Text(title, style: style)),
  //         Text(value, style: unite ? style : null),
  //       ],
  //     ),
  //   );
  // }


  static pw.Widget buildHeader(Invoice invoice) => pw.Column(
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
                        'حسني ابو تمام',
                        textDirection: pw.TextDirection.rtl,

                        style: pw.TextStyle(
                            color: PdfColor.fromHex("#222b43"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      pw.SizedBox(width: 120,),

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
                        '12/12/2023',
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
                        '121211313',
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
                        'حسني ابو تمام',
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

static pw.Widget buildFooter(Invoice invoice) => pw.Column(
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
                      '20 %',
                      textDirection: pw.TextDirection.rtl,

                      style: pw.TextStyle(
                          color: PdfColor.fromHex("#222b43"),
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
                      '800 ',
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
