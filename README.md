# Progetto 4 - Machine Learning su MNIST (Esercizio 2)

Autore: **Antonio Ferri**  
Data relazione: **9 luglio 2022**

Questo repository contiene la parte di **Machine Learning (Esercizio 2)** del Progetto 4.
Il focus è la classificazione delle cifre MNIST (`0-9`) con una rete neurale feed-forward in MATLAB, insieme a un'analisi qualitativa e quantitativa degli errori.

## Contenuto del progetto

- training della rete su dataset MNIST,
- test su set separato,
- analisi delle misclassificazioni,
- osservazione del comportamento degli strati nascosti,
- discussione dei limiti e possibili miglioramenti.

## Obiettivo dell'Esercizio 2

Far riconoscere a una macchina cifre scritte a mano, rappresentate come immagini in scala di grigio `28x28`, usando un **Multi Layer Perceptron (MLP)** con due hidden layer.

## Dataset e formato

Nel progetto i dati sono organizzati con la convenzione:

- prima colonna: etichetta corretta (digit `0..9`),
- colonne successive: pixel dell'immagine (784 valori),
- immagini normalizzate in `[0,1]` prima del passaggio in rete.

File principali dei dati:

- `data_train.mat` -> training set
- `data_test.mat` -> test set

## Architettura della rete

La rete usata nel training è:

- input layer: `784` feature
- hidden layer 1: `80` neuroni
- hidden layer 2: `60` neuroni
- output layer: `10` neuroni (una classe per cifra)

Learning rate usato nella relazione: `0.0058`.

### Inizializzazione (come in relazione)

- `w12 = randn(80,784) * sqrt(2/784)`
- `w23 = randn(60,80) * sqrt(2/80)`
- `w34 = randn(10,60) * sqrt(2/60)`
- bias inizializzati random (`b12`, `b23`, `b34`)

## Pipeline algoritmica

Per ogni epoca di training:

1. **Feed-Forward**
2. **Back-Propagation**
3. **Gradient Descent** su pesi e bias
4. Shuffle dei campioni per l'epoca successiva

L'addestramento in relazione è eseguito su **50 epoche**.

## Risultati riportati nella relazione

Su 10.000 immagini di test:

- corrette: **9724**
- errate: **276**
- errore: **2.76%**

Il testo evidenzia che:

- una parte degli errori è dovuta ad ambiguità visiva (anche per un umano),
- altre misclassificazioni avvengono su cifre apparentemente ben leggibili.

## Analisi degli errori (dal report)

Dalla distribuzione degli errori sulle 276 immagini non predette:

- la cifra **3** è la classe più critica,
- classi come **1** e **5** risultano meno problematiche,
- possibile direzione migliorativa: aumentare esempi di training per classi più difficili (es. cifra 3).

## Figures extracted from the report

The figures below are extracted from `Progetto4.pdf` as image-only content (not full page screenshots).

### 1) Error analysis chart

![Error analysis chart](figures/images_only_02_crop.png)

### 2) Internal layer comparison chart

![Internal layer comparison chart](figures/images_only_03_crop.png)

### 3) Final result/summary visualization

![Final result summary](figures/images_only_08_crop.png)

## Struttura file

Script MATLAB:

- `digit_train.m` -> training della rete
- `digit_test.m` -> inferenza e accuratezza
- `elu.m` -> funzione di attivazione
- `elup.m` -> derivata della funzione di attivazione
- `shuffle.m` -> mescolamento campioni

Parametri salvati:

- pesi: `wtwo.mat`, `wthree.mat`, `wfour.mat`
- bias: `btwo.mat`, `bthree.mat`, `bfour.mat`

Relazione:

- `Progetto4.pdf` (documento principale)
- `Proj4.pdf` (copia/versione alternativa)

## Come eseguire

Aprire MATLAB nella cartella del progetto.

### Training

```matlab
run('digit_train.m')
```

Output atteso:

- stampa epoche,
- salvataggio pesi/bias nei file `.mat`.

### Test

```matlab
run('digit_test.m')
```

Output atteso:

- stampa accuratezza percentuale sul test set.

## Interpretazione dei risultati

Il progetto dimostra una pipeline completa di classificazione su MNIST con accuratezza elevata, ma anche con margini di miglioramento rispetto a modelli più moderni (es. CNN).

## Limiti

- approccio MLP classico, non convoluzionale,
- sensibilità ad alcune cifre simili (in particolare classe 3),
- assenza di data augmentation e tecniche avanzate di ottimizzazione.

## Possibili miglioramenti futuri

- passaggio a CNN,
- data augmentation,
- tuning più spinto di iperparametri,
- loss/attivazione di output più standard per classificazione multiclasse,
- analisi confusion matrix per classe.

## Nota finale

Questo README è focalizzato sulla parte **Esercizio 2** e segue i risultati discussi nella relazione originale.
