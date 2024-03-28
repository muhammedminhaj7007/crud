class UserName{
 String name;
 String email;
 String password;
 UserName({required this.name,required this.email,required this.password,});

 ///to Map
 Map<String, dynamic> toMap() {
   return {
     'name':name,
     'email': email,
     'password': password,
   };
 }
 
 ///from map
 factory UserName.fromMap(Map<String, dynamic> map) {
   return UserName(
       name: map['name'].toString(),
       email:map['email'].toString(),
       password:map['password'].toString());
 }
///copywith
 UserName copyWith({
   String? name,
   String? email,
   String? password,
 }) {
   return UserName(
        name: name ?? this.name, email: email ?? this.email , password:password ?? this.password);
 }
}