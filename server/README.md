# Server
Implemented with Node.js and MongoDB. There are major routes designed to serve both IOS clientside and Web client side. Both clients submit to the same route, but web client side will also use GET request to retrieve html files. For authentication, we store JWT in the user's cookie, and  conveniently IOS's alamofire library also allows for cookie storage.
 

# File structure.
The server uses MVC pattern, which means that the folders are divided into routers, business logics(services), and database models. 
All authentication related code are in services/Authentication.js
