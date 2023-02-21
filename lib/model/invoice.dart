import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:generate_pdf_invoice_example/model/supplier.dart';

import 'Footer.dart';
import 'Header.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const InvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}

///////////////////////

class Invoice2 {
 // final InvoiceInfo info;
  final Header header;
  final Footer footer;
  final List<TableItem> items;

  // final List<InvoiceItem> items;

  const Invoice2({
   // required this.info,
    required this.header,
    required this.footer,
    required this.items
    //required this.items,
  });
}
class TableItem {
  final String ProductName;
  final int ProductQuantity;
  final double ProductPrice;
 // final double Total;
 // final double unitPrice;

  const TableItem({
    required this.ProductName,
    required this.ProductQuantity,
    required this.ProductPrice,
   // required this.Total,
   // required this.unitPrice,
  });
}
