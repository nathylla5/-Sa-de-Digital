import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final String urlImage;
  final String patientName;
  final String username;
  final String completeName;
  final String birthDate;
  final String age;
  final String phoneNumber;
  final List<String> diseases;

  const ProfileView(
      {Key? key,
      required this.urlImage,
      required this.patientName,
      required this.username,
      required this.completeName,
      required this.age,
      required this.phoneNumber,
      required this.diseases,
      required this.birthDate})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final endDate = DateTime.now().add(Duration(days: 30));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(widget.urlImage),
          ),
          const SizedBox(height: 15.0),
          Text(
            widget.patientName,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          Text(
            widget.username,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Text('Está chegando o dia de voltar ao médico!',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600])),
          const SizedBox(height: 4),
          Text('FALTAM EXATAMENTE:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600])),
          const SizedBox(height: 15.0),
          //timer
          StreamBuilder<int>(
            stream: Stream.periodic(Duration(seconds: 1), (i) => i),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              final currentTime = DateTime.now();
              final remainingTime = endDate.difference(currentTime);

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.cyan[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${remainingTime.inDays}",
                            style: const TextStyle(
                                fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dias',
                        style: TextStyle(fontSize: 14, color: Colors.cyan[700]),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.cyan[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${remainingTime.inHours.remainder(24)}",
                            style: const TextStyle(
                                fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Horas',
                        style: TextStyle(fontSize: 14, color: Colors.cyan[700]),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.cyan[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${remainingTime.inMinutes.remainder(60)}",
                            style: const TextStyle(
                                fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Minutos',
                        style: TextStyle(fontSize: 14, color: Colors.cyan[700]),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.cyan[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${remainingTime.inSeconds.remainder(60)}",
                            style: const TextStyle(
                                fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Segundos',
                        style: TextStyle(fontSize: 14, color: Colors.cyan[700]),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                ],
              );
            },
          ),
          const SizedBox(height: 25.0),
          Text('Dados do Paciente',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600])),
          const SizedBox(height: 10),
          Text('Nome Completo:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text(widget.completeName,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Data de Nascimento:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text(widget.birthDate,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Idade:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text(widget.age,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Telefone:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text(widget.phoneNumber,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Doenças:',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text('${widget.diseases}',
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Editar perfil',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[600])),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                shadowColor: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
