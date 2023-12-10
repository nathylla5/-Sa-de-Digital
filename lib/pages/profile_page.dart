import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/data_api.dart';
import '../domain/user.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  DataApi apiService = DataApi();
  late Future<User> userProfile;
  final endDate = DateTime.now().add(const Duration(days: 30));

  @override
  void initState() {
    super.initState();
    userProfile = fetchUserData(1);
    userProfile.then((user) {
      print('Dados do usuário: $user');
    });
  }


  Future<User> fetchUserData(int userId) async {
    try {
      Map<String, dynamic> userData = await apiService.fetchFakeUserData(userId);
      print(userData);
      return User.fromJson(userData);
    } catch (e) {
      throw Exception('Erro ao carregar dados do usuário: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<User>(
            future: userProfile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User profile = snapshot.data!;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profile.urlImage),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      profile.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan),
                    ),
                    Text(
                      profile.username,
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
                    StreamBuilder<int>(
                      stream:
                          Stream.periodic(const Duration(seconds: 1), (i) => i),
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan[700]),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan[700]),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan[700]),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan[700]),
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
                        style:
                            TextStyle(fontSize: 18, color: Colors.cyan[300])),
                    Text(profile.name,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('Data de Nascimento:',
                        style:
                            TextStyle(fontSize: 18, color: Colors.cyan[300])),
                    Text(profile.birthDate,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('Idade:',
                        style:
                            TextStyle(fontSize: 18, color: Colors.cyan[300])),
                    Text('${profile.calculateAge()}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('Telefone:',
                        style:
                            TextStyle(fontSize: 18, color: Colors.cyan[300])),
                    Text(profile.phone,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('Doenças:',
                        textAlign: TextAlign.right,
                        style:
                            TextStyle(fontSize: 18, color: Colors.cyan[300])),
                    Text('${profile.diseases}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Editar perfil',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan[600])),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          elevation: 0,
                          shadowColor: Colors.transparent),
                    ),
                  ],
                );
              }

              return const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              );
            }));
  }
}
