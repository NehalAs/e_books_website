import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PDFViewerScreen extends StatelessWidget {
   PDFViewerScreen({super.key,required this.pdfUrl});

  late String pdfUrl;
  @override
  Widget build(BuildContext context) {
    // final pdfController = PdfController(
    //   // document: PdfDocument.(pdfUrl),
    // );
    return Scaffold(
      body:WebView(
        initialUrl: pdfUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
