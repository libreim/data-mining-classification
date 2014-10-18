# Ejemplos asociados al seminario de algoritmos de
# clasificación en Minería de datos

# install.packages("RWeka")
# install.packages('e1071',dependencies=TRUE)
# install.packages("partykit")
library(RWeka)
library(e1071)
library(partykit)

#----- Gráfico multiclase -----

data(iris)
plot(iris$Petal.Length ~ iris$Petal.Width, col=iris$Species, pch=20)

#----- kNN -----

# Cargamos dataset
iris <- read.arff(system.file("arff", "iris.arff", package = "RWeka"))
# Generamos clasificador kNN con k = 10
classifier <- IBk(class ~., data = iris, control = Weka_control(K = 10))
# Evaluamos con validación cruzada
evaluate_Weka_classifier(classifier, numFolds = 5)

#----- Árbol de decisión -----

# Cargamos dataset
iris <- read.arff(system.file("arff", "iris.arff", package = "RWeka"))
# Generamos clasificador C4.5 con parámetros por defecto
classifier <- J48(class ~., data = iris)
# Mostramos árbol de decisión
plot(classifier)

#----- SVM -----

# Cargamos dataset integrado en R
data(iris)
# Nos quedamos con 2 características
iris2 <- data.frame(Petal.Width = iris$Petal.Width,
                    Petal.Length = iris$Petal.Length,
                    Species = iris$Species)
# Eliminamos una de las clases
iris2$Species[iris2$Species == "virginica"] <- "versicolor"
# Generamos un modelo de máquina de vectores de soporte
model <- svm(Species~., data = iris2)
# Mostramos un gráfico del modelo
plot(model, iris2, grid = 200)

