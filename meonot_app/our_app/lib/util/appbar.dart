import 'package:our_app/util/resources/importss.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool middle;
  final bool isProfile;
  const MyAppBar({super.key, this.text = "", this.middle = false, this.isProfile = false});

  String _checktime() {
    //check time for greeting
    String temp;
    DateTime now = DateTime.now();
    int hours=now.hour;
    if(text==""){
      if(hours>=1 && hours<=12){ 
      temp = "בוקר טוב"; 
      } else if(hours>=12 && hours<=16){
      temp = "צהריים טובים";
      } else if(hours>=16 && hours<=18){
      temp = "אחר הצהריים טובים";
      } else if(hours>=18 && hours<=21){ 
      temp = "ערב טוב";
      }
      else {
      temp = "לילה טוב"; 
      }
      String profileName = myProfile.name;
      // TODO: change Guest to name when doron finishes profile
      return "$temp, $profileName";
    }
    return text; 
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: middle,
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(_checktime(),
        style: const TextStyle(fontWeight: FontWeight.bold,
        fontSize: 22),
        ),
      ),
      actions:[
        IconButton(onPressed: (){
          if(!isProfile){
            Navigator.pushNamed(context, '/profilepage');
            }
        }, 
        icon: const Icon(Icons.account_circle),
        iconSize: 36)
      ]
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(80);
}