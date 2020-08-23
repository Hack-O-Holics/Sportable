# Video Classifier

## Background
The i3D model is a version of Inception-v1 with batch normalization that has been pre-trained on ImageNet and then "inflated" from 2 dimensions into 3 dimensions. Google Deepmind, the creators of the model, then trained it on their massive "Kinetics Human Action Video Dataset." Given the similarity between the Kinetics dataset and our task of classifying videos of people doing exercises, I observed a strong opportunity for using their model in a deep learning technique called Transfer Learning. Transfer Learning is wheb pretrained models are loosely trained on new data, and is frequently used when there are not large enough datasets avaiable to train on. Because we created our own dataset of only a few hundred videos through web scraping and manually taking videos of ourselves, transfer learning seemed like the best approach to take. Although we didn't train it for long, it seemed to pick up on differences in form between exercises such as push ups and squats quite quickly, while having a harder time detecting correct form for crunches.

![visualization](https://i.ibb.co/4pVQM7K/visualization.gif)

The i3D model uses a two-stream architecture in which a video is pre-processed into two streams: RGB and optical flow (look at the image above). There is a separate model for each stream, and the output of the models are combined only at the logit-level. Then, class predictions are formed using the combined logits.

While retraining the model, I stripped off the last two layers of the i3D model (logits and predictions) and replaced them with similar layers. The new logit-layer has the correct number of `output_channels` for this use case (10 classes). Logits for each stream, *RGB* and *optical flow*, are combined and used to form predictions in the same format as the original implementation Google Deepmind did.

```
# classes:
squat_correct
squat_not-low
pull-up_correct
push-up_not-low
push-up_butt-up
push-up_not-straight
crunch_correct
crunch_heels-up
crunch_not-enough
crunch_bad-hands
```

## Feasability
Even though we got a reasonably high accuracy during training, because the custom dataset we created was so small, the model was unable to generalize on videos of new users. Because of this, we didn't include the classifier in the final demo. Hopefully, with larger datasets, we will be able to retrain the model using this technique and use it in our final product.
