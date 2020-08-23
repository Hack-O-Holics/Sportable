# Video Classifier

## Background
The i3D model is a version of Inception-v1 with batch normalization which has been pre-trained on ImageNet and then "inflated" from 2 dimensions into 3 dimensions. Google Deepmind, the creators of the model, then trained it on their massive "Kinetics Human Action Video Dataset." Given the similarity between the Kinetics dataset and our task of classifying videos of people doing exercises, I observed a strong opportunity for using their model, in a deep learning technique called Transfer Learning. Transfer Learning is where pretrained models are loosely trained on new data, and is frequently used when there are not large enough datasets avaiable to train on, as in our case.

![visualization](https://i.ibb.co/4pVQM7K/visualization.gif)

The i3D model uses a two-stream architecture in which a video is pre-processed into two streams: RGB and optical flow (look at the image above). There is a separate model for each stream, and the output of the models are combined only at the logit-level. Then, class predictions are formed using the combined logits.

## Feasability
Even though we got a high accuracy during training, because the custom dataset we created was so small, the model was unable to generalize on videos of new users. Because of this in the in the final demo, we didn't include this classifier. Hopefully, with larger datasets, we will be able to retrain the model using this technique and use it in our final product.
