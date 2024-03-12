import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    onSubmitt: (value){print(value);},
                    onChange: (value){print(value);},
                    label: 'Email',
                    prefix: const Icon(Icons.email),
                    validate: (value) {
                      if(value.isEmpty){
                        return 'password must not be empty';

                      }
                      return null;
                    },

                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    obsecure: isPassword,
                    validate: (value){

                      if(value.isEmpty)
                      {
                        return 'password must not be empty';
                      }
                      return null;
                    },

                    label: 'Password',
                    prefix: const Icon(Icons.lock),
                    suffix: IconButton(
                      onPressed: (){
                        // setState(() {
                        //   isPassword=!isPassword;
                        // });

                      },
                      icon:isPassword?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                    ),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),

                  defaultButton(
                    text: 'login',
                    function: (){

                      if(formKey.currentState!.validate()){

                        print(emailController.text);
                        print(passwordController.text);
                      }

                    },
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an accunt ?'),
                      TextButton(onPressed: (){}, child: const Text('Rigister now'),),
                    ],
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }

   Widget defaultFormField (
   {
   required TextEditingController controller,
   required   TextInputType type  ,
   Function? onChange(value)?,
   Function? onSubmitt(value)?,
   Function ()?onTap,
   required String? validate(value),
   required String label,
   required Icon prefix,
   IconButton? suffix,
   bool outLineBorder = true,
   bool obsecure = false,
}
) =>
TextFormField(
controller: controller ,
keyboardType: type,
onFieldSubmitted: onSubmitt,
onChanged:  onChange,
onTap:onTap,
validator: validate,
obscureText: obsecure,
decoration: InputDecoration(
labelText: label ,
prefixIcon: prefix,
suffixIcon:suffix ,
border: outLineBorder?const OutlineInputBorder():null,
),
);
Widget defaultButton(
{
double width =double.infinity,
Color background = Colors.blue,
required   Function ()function,
bool isUppercase = true,
required String text,
double radius= 0.0,


})=>
Container(
width: width,
height: 40.0,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(radius),
color: background,
),
child: MaterialButton(
onPressed:function,
child: Text(
isUppercase? text.toUpperCase():text,
style: const TextStyle(
color: Colors.white,
fontSize: 15.0,
),
) ,

),
);
}
