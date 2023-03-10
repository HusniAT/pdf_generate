import 'package:flutter/material.dart';
import 'package:generate_pdf_invoice_example/api/pdf_api.dart';
import 'package:generate_pdf_invoice_example/api/pdf_invoice_api.dart';
import 'package:generate_pdf_invoice_example/main.dart';
import 'package:generate_pdf_invoice_example/model/Footer.dart';
import 'package:generate_pdf_invoice_example/model/Header.dart';
import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:generate_pdf_invoice_example/model/invoice.dart';
import 'package:generate_pdf_invoice_example/model/supplier.dart';
import 'package:generate_pdf_invoice_example/widget/button_widget.dart';
import 'package:generate_pdf_invoice_example/widget/title_widget.dart';
import 'package:intl/intl.dart';

import '../api/pdf_invoice_ap2i.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TitleWidget(
                //   icon: Icons.picture_as_pdf,
                //   text: 'Generate Invoice',
                // ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: 'Sarah Field',
                        address: 'Sarah Street 9, Beijing, China',
                        paymentInfo: 'https://paypal.me/sarahfieldzz',
                      ),
                      customer: Customer(
                        name: 'Apple Inc.',
                        address: 'Apple Street, Cupertino, CA 95014',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Coffee',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 5.99,
                        ),
                        InvoiceItem(
                          description: 'Water',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Orange',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 2.99,
                        ),
                        InvoiceItem(
                          description: 'Apple',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 3.99,
                        ),
                        InvoiceItem(
                          description: 'Mango',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0.19,
                          unitPrice: 1.59,
                        ),
                        InvoiceItem(
                          description: 'Blue Berries',
                          date: DateTime.now(),
                          quantity: 5,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Lemon',
                          date: DateTime.now(),
                          quantity: 4,
                          vat: 0.19,
                          unitPrice: 1.29,
                        ),




                      ],
                    );

                    final invoice2 = Invoice2(
                      header:Header(
                          clientName:"???????? ???????? ?????? ???????? ",
                          Date:currentDate,
                          OrderNum:"123445",
                        sellerName: "???????? ????????????",
                      ) ,
                      footer: Footer(
                        Discount: "50 %",
                          netCost:"1000",
                      ),
                      items: [
                        TableItem(
                         ProductName:"???????? " ,
                          ProductPrice: 0.5,
                          ProductQuantity: 2,
                        //  Total:1 ,
                        ),
                        TableItem(
                          ProductName:"???????? " ,
                          ProductPrice: 2.5,
                          ProductQuantity: 3,
                        //  Total:0 ,
                        ),
                        TableItem(
                          ProductName:"?????? " ,
                          ProductPrice: 0.5,
                          ProductQuantity: 5,
                          //  Total:0 ,
                        ),
                        TableItem(
                          ProductName:"UK" ,
                          ProductPrice: 0.5,
                          ProductQuantity: 5,
                          //  Total:0 ,
                        ),
                        for(int i=0;i<3;i++)TableItem(
                          ProductName:"${i}" ,
                          ProductPrice: 0.5,
                          ProductQuantity: 5,
                          //  Total:0 ,
                        ),

                      ]


                    );


                    final pdfFile = await PdfInvoiceApi.generate(invoice);
                    final pdfFile2 = await PdfInvoiceApi2.generate2(invoice2);

                    PdfApi.openFile(pdfFile2);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
