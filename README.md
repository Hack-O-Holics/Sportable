# Sportable

NOTE: Check Github Repo for the most up-to-date video.

## Demo
[![](http://img.youtube.com/vi/h71szkri2CI/0.jpg)]("http://www.youtube.com/watch?v=h71szkri2CI")

## About Us
Shreeniket, Agnik, Devin, and Johnny are all rising sophmores living in the United States. Although we have different interests and experience in computer science, we all wanted to create a project that truly helps our communities.

## Inspiration
Fitness exercises are very beneficial to personal health and physical well being; however, they can also be ineffective and potentially dangerous if performed incorrectly by the athlete. Exercise mistakes are made when the user does not use the proper form, or pose. With gyms closed due to the pandemic, more people have started doing home workouts and physical education classes for school have gone virtual, meaning that coaches have been unable to help their students correct their form. Making an app that can give instant feedback to users when they do an exercise and finding a way to teach proper form more interactively will solve these problems, and change the scene for athletic coaching entirely.

## What It Does
Our app, Sportable, allows for students and normal users to submit short clips of themselves, which, using computer vision, detects if the form is incorrect or not, and what they have to change. Look at the `README.md` in the `video-classifier` section of our repo to learn how this works. Our app also has features allowing users to learn how to to do a variety of exercises using AR (augmented reality). Sportable has special functionality for schools, allowing P.E. teachers to organize classrooms and assign workout assignments, which can be submitted by students through the app. A better explanation of what Sportable does can be found in the demo.

## How We Built It
In order to build a form classifier, we scraped workout videos from YouTube in order to train to create a dataset, as we couldn't find a public dataset that contained videos of correct and incorrect form. We then trained a neural network, based on an Inflated 3D ConvNet architecture, loosely inspired from (this research paper)["Quo Vadis, Action Recognition? A New Model and the Kinetics Dataset."]. Even though the model had a state-of-the-art architecture, because the dataset was only a few hundred videos long, results were inconclusive and we didn't incorporate the model in our final demo. Again, Look at the `README.md` o the `video-classifier` section of our repo to further learn about the model, and why it didn't work the way we wanted. 

![Drag Racing](https://lh3.googleusercontent.com/-NWBZS6k57Pk/Xzx0NDxYNmI/AAAAAAAAEys/diFRuSVXPY8vhiyfzVMaMztpbXtUpQKuwCK8BGAsYHg/s512/2020-08-18.png])

In order to send videos and information from the app we implemented a server using with Node.js MongoDB. There are major routes designed to serve both IOS clientside and Web client side. Both clients submit to the same route, but web client side will also use GET request to retrieve html files. For authentication, we store JWT in the user's cookie, and conveniently IOS's alamofire library also allows for cookie storage.

For building the VR aspects of our app, we used echoAR, a great tool that allows us to easily create and deploy AR applications. We created the UI/app using XCode and Swift, and a login website using HTML and CSS.

## Challenges We Ran Into
Creating our own custom dataset of common exercises with correct and incorrect form and scraping the web for those videos was a time-consuming and difficult process. Even though we got hundreds of videos eventually, we still need more data to build a more accurate classifier. Sending videos from the iOS app to the AWS server was also challenging, due to poor documentation. 

## Accomplishments That We're Proud Of
We're proud of finishing a complex project in such a short amount of time and hopefully making an impact on the fitness/athletic training community.

## What We Learned
We learned how to make requests between iOS client to an AWS server, as well as video classification with neural networks

## What's Next For Sportable
Hopefully larger exercise form datasets will be created, so we can retrain our model and make it more efficient, as well as detecting a wider variety of mistakes in common exercises.
