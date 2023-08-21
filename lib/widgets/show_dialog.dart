import 'package:flutter/material.dart';

class SuccessRegisterDialog extends StatefulWidget {
  //final String urlImage;
  final String primaryText;
  final String secondText;
  final String page;
  final Widget nextPage;

  const SuccessRegisterDialog(
      {Key? key,
      required BuildContext context,
      //required this.urlImage,
      required this.primaryText,
      required this.secondText,
      required this.page,
      required this.nextPage})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SuccessRegisterDialogState();

  void showAlertDialog(
    BuildContext context,
    Widget nextPage,
    String page,
    String primaryText,
    String secondText,
    /*String urlImage*/
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessRegisterDialog(
          context: context,
          nextPage: nextPage,
          page: page,
          primaryText: primaryText,
          secondText: secondText,
          //urlImage: urlImage,
        );
      },
    );
  }
}

class _SuccessRegisterDialogState extends State<SuccessRegisterDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        height: 300,
        child:  Center(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ 
            //CardImage(urlImage: widget.urlImage),
            const SizedBox(height: 16),
            Text(widget.primaryText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            const SizedBox(height: 16),
            Text(widget.secondText,
                style: TextStyle(color: Colors.grey[300], fontSize: 15)),
            const SizedBox(height: 26),
            ButtonTheme(
              minWidth: 300,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => widget.nextPage),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(0, 131, 143, 1)),
                ),
                child: Text(
                  'Ir para tela de ' + widget.page,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
            ),
        ) 
        ),
    );
  }
}
