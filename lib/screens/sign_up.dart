
import 'package:flutter/material.dart';
import 'package:flutter1/widgets/app_strings.dart';
import 'package:flutter1/widgets/colors.dart';
import 'package:flutter1/widgets/snackbar.dart';



class Singn_Up extends StatefulWidget {
  
  const Singn_Up({super.key});

  @override
  State<Singn_Up> createState() => _Singn_UpState();
}

class _Singn_UpState extends State<Singn_Up> {
  TextEditingController userController = TextEditingController(); 
  TextEditingController passwordcontroller = TextEditingController(); 
  TextEditingController emailController = TextEditingController(); 
  final _formkey= GlobalKey<FormState>();
  bool passToggle =false;
 //FirebaseAuthService _auth =FirebaseAuthService();



  @override
 void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.buttonbg,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text(AppStrings.login,style:TextStyle(color: AppColors.white,fontWeight:FontWeight.w500),),
        leading:Icon(Icons.menu_book,color:AppColors.white),
        centerTitle:true,
      ),

      body: SingleChildScrollView(
        child: Padding(  
              padding: EdgeInsets.all(15),  
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[ 
                      const CircleAvatar(
                      radius: 80,
                     backgroundImage: AssetImage('images/login_cirlce.jpg',
                      ),
                    ),
                    
                    Padding(  
                      padding: EdgeInsets.all(15),  
                      child: TextFormField(  
                        controller:userController, 
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                          return 'Please enter name';
                          }
                          return null;
                          
                          }, 
                        decoration: const InputDecoration(  
                          border: OutlineInputBorder(),
                          prefixIcon:Icon(Icons.email), 
                          prefixIconColor: AppColors.containerFill,
                          labelText: 'User name',  
                          hintText: 'Enter Your name',  
                        ),  
                      ),  
                    ),
                    Padding(  
                      padding: EdgeInsets.all(15),  
                      child: TextFormField(  
                        controller:emailController, 
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                          return 'Please enter email';
                          }
                          return null;
                          
                          }, 
                        decoration: const InputDecoration(  
                          border: OutlineInputBorder(),
                          prefixIcon:Icon(Icons.email), 
                          prefixIconColor: AppColors.containerFill,
                          labelText: 'User email',  
                          hintText: 'Enter Your name email',  
                        ),  
                      ),  
                    ),   
                    Padding(  
                      padding: EdgeInsets.all(15),  
                      child: TextFormField(  
                        controller:passwordcontroller,  
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter password';
                        }
                        else if(passwordcontroller.text.length<6){
                          return 'password should be more than 6 characters';
                        }
                       },
                        obscureText:passToggle,
                        decoration:  InputDecoration(  
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: AppColors.containerFill,
                          suffix: InkWell(
                            onTap:(){
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child:Icon(passToggle? Icons.visibility : Icons.visibility_off),
                          ), 
                          labelText: 'Password',  
                          hintText: 'Enter Password',  
                        ),  
                      ),  
                    ),  
              
                    Padding(
                      padding:EdgeInsets.all(15),
                      child: ElevatedButton.icon(onPressed: ()async{
                      if(_formkey.currentState!.validate()){
                      
                     //_signup();
                    // await  _authService.emailandpassword(emailController.text,passwordcontroller.text);
                              
                    
                        print('success');
                        emailController.clear();
                        passwordcontroller.clear();
                        Navigator.pushReplacementNamed(context, '/dashboard');
                        
                      }
                      else{
                        showSnackBar(context:context, msg:AppStrings.Msg);
                      }
                      
                      }, icon:Icon(Icons.login),
                       label:const Text(AppStrings.create),
                         style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)),
                                    
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                       ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.already,
                        style:TextStyle(
                          fontSize: 17,
                        ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context,'/logout');
                        }, child:Text(AppStrings.login,
                        style:TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.bold
                        )),
                        )
                      ],
                    )
                  ],  
                ),
              )  
          ),
      )  
    
    );
    
  }

}