void main() {

}

// im trying to run this mutation with variables from flutter

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Mutation(
          options: MutationOptions(
            documentNode: gql(login),
          ),
          builder: (
            RunMutation runMutation,
            QueryResult result,
          ) {
            if (!result.hasException && result.data != null) {
              print(result.data);
            }
            if (result.hasException) {
              print(result.exception);
            }
            return FloatingActionButton(
              child: Text('login'),
              onPressed: () => runMutation(
                {'email': 'brokercl@gmail.com'},
              ),
            );
          }),
    );
  }
}

/*
 but until now nothing

the node server work fine
when I for example use
*/
mutation login{
  login(email: "brokercl@gmail.com"
    password: "brokercl"
  ) {
    token
  }
}
//the playgroung response

{
  "data": {
    "login": {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjazhyeT6AvHE" //(token incomplete for this sample)
    }
  }
}

//but when I from flutter use

final String login = r'''
mutation login{
  login(email: $email,
    password: $password
  ) {
    token
  }
}
''';

//the console response 
Variable "$email" is not defined by operation "login".: Undefined location

//when I try
final String login = r'''
mutation login{
  login(email: String!,
    password: $password
  ) {
    token
  }
}
''';
//the console complain 
Error on line 2, column 22: Expected an argument name
  ╷
2 │   login(email: String!,
  │                      ^

//and when I try
final String login = r'''
mutation login{
  login(email: "String!",
    password: "String!"
  ) {
    token
  }
}
''';
//the console again complain
I/flutter (17358): No such email found! String!: Undefined location


//I'm lost 


