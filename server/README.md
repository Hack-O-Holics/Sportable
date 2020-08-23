# Server
Implemented with Node.js and MongoDB. There are major routes designed to serve both IOS clientside and Web client side. Both clients submit to the same route, but web client side will also use GET request to retrieve html files. For authentication, we store JWT in the user's cookie, and  conveniently IOS's alamofire library also allows for cookie storage.

# Database structure
To achieve a feature of letting user sign up for courses, and receive assignments from that course, the database is divided into three specific models- User, Class, and Assignment. Each user model contains the class that the user is enrolled in. Similarly, class model and assignments are one way reference(class-> assignments), so that it will be easy to retrieve all the assignment from the class.
 

# File structure.
The server uses MVC pattern, which means that the folders are divided into routers, business logics(services), and database models. 
All authentication related code are in services/Authentication.js
