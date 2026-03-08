# MNIST Digit Classification with MLP (MATLAB)

Author: **Antonio Ferri**

This repository contains a **Machine Learning** project for MNIST digit classification (`0-9`) using a feed-forward neural network implemented in MATLAB, with both qualitative and quantitative error analysis.

## Project Overview

- network training on MNIST,
- testing on a separate dataset,
- misclassification analysis,
- hidden-layer activation inspection,
- discussion of limitations and possible improvements.

## Goal

Train a model to recognize handwritten digits represented as `28x28` grayscale images using a **Multi-Layer Perceptron (MLP)** with two hidden layers.

## Dataset and Format

Data is organized as follows:

- first column: ground-truth label (`0..9`),
- remaining columns: image pixels (`784` values),
- pixel values normalized in `[0,1]` before inference/training.

Main dataset files:

- `data_train.mat` -> training set
- `data_test.mat` -> test set

## Network Architecture

The model used for training is:

- input layer: `784` features
- hidden layer 1: `80` neurons
- hidden layer 2: `60` neurons
- output layer: `10` neurons (one per class)

Learning rate used in experiments: `0.0058`.

### Initialization

- `w12 = randn(80,784) * sqrt(2/784)`
- `w23 = randn(60,80) * sqrt(2/80)`
- `w34 = randn(10,60) * sqrt(2/60)`
- random bias initialization (`b12`, `b23`, `b34`)

## Training Pipeline

For each training epoch:

1. **Feed-Forward**
2. **Back-Propagation**
3. **Gradient Descent** update for weights and biases
4. sample shuffling for the next epoch

Training is run for **50 epochs**.

## Reported Results

On 10,000 test images:

- correct predictions: **9724**
- wrong predictions: **276**
- error rate: **2.76%**

Main observations:

- some errors are caused by visually ambiguous digits,
- other errors occur on digits that look clear even to humans.

## Error Analysis

From the distribution over the 276 misclassified images:

- digit **3** is the most critical class,
- classes like **1** and **5** are less problematic,
- a possible improvement is adding more training examples for difficult classes (e.g., digit 3).

## Figures

### 1) Error analysis chart

![Error analysis chart](figures/mnist_error_distribution.png)

### 2) Internal layer comparison chart

![Internal layer comparison chart](figures/mnist_hidden_layer_activations.png)

### 3) Final result / misclassification examples

![Final result summary](figures/mnist_misclassified_examples.png)

## File Structure

MATLAB scripts:

- `digit_train.m` -> model training
- `digit_test.m` -> inference and test accuracy
- `elu.m` -> activation function
- `elup.m` -> derivative of activation function
- `shuffle.m` -> sample shuffling

Saved parameters:

- weights: `wtwo.mat`, `wthree.mat`, `wfour.mat`
- biases: `btwo.mat`, `bthree.mat`, `bfour.mat`

## How to Run

Open MATLAB in the project folder.

### Training

```matlab
run('digit_train.m')
```

Expected output:

- epoch progress logs,
- saved weight/bias `.mat` files.

### Test

```matlab
run('digit_test.m')
```

Expected output:

- printed test-set accuracy.

## Result Interpretation

This project provides a full MNIST classification pipeline with good accuracy, while still leaving room for improvement compared to modern models (e.g., CNNs).

## Limitations

- classical MLP (non-convolutional),
- sensitivity to visually similar digits (especially class 3),
- no data augmentation or advanced optimization strategies.

## Possible Future Improvements

- migrate to CNN architectures,
- add data augmentation,
- perform deeper hyperparameter tuning,
- use more standard output-loss setups for multiclass classification,
- include per-class confusion matrix analysis.

## Final Note

This README is self-contained and summarizes the implemented workflow and key results.
