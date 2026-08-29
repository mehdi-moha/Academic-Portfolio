import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA, KernelPCA
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis 
from sklearn.naive_bayes import GaussianNB
from sklearn.neural_network import MLPClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import mean_squared_error, accuracy_score

# 1. Load Data
IRIS = datasets.load_iris()
X = IRIS.data
Y_Data = IRIS.target

# 2. Split Data
Xtr_raw, Xte_raw, Ytr, Yte = train_test_split(X, Y_Data, train_size=75, test_size=75, random_state=1, stratify=Y_Data)

# 3. Scaling
sc = StandardScaler()
Xtr_scaled = sc.fit_transform(Xtr_raw)
Xte_scaled = sc.transform(Xte_raw)

# 4. Dimensionality Reduction

# --- PCA ---
pca = PCA(n_components=3)
Xtr_pca = pca.fit_transform(Xtr_scaled)
Xte_pca = pca.transform(Xte_scaled)

# --- Kernel PCA ---
gamma = 1 / Xtr_scaled.shape[1]
kpca = KernelPCA(n_components=3, kernel='rbf', gamma=gamma)
Xtr_kpca = kpca.fit_transform(Xtr_scaled)
Xte_kpca = kpca.transform(Xte_scaled)

# 5. Combine Features
Xtr_final = np.column_stack((Xtr_scaled, Xtr_pca, Xtr_kpca))
Xte_final = np.column_stack((Xte_scaled, Xte_pca, Xte_kpca))

# 6. Classification

# SVM
SVM = SVC(kernel='rbf', gamma=gamma)
SVM.fit(Xtr_final, Ytr)
SVM_Yte_pred = SVM.predict(Xte_final)
print('SVM Training MSE: ', mean_squared_error(Ytr, SVM.predict(Xtr_final)))
print('SVM Test MSE: ', mean_squared_error(Yte, SVM_Yte_pred))
print('SVM Test Error Rate: ', 1 - accuracy_score(Yte, SVM_Yte_pred))
print('SVM Iterations: -\n')

# LDA
LDA = LinearDiscriminantAnalysis(solver='lsqr')
LDA.fit(Xtr_final, Ytr)
LDA_Yte_pred = LDA.predict(Xte_final)
print('LDA Training MSE: ', mean_squared_error(Ytr, LDA.predict(Xtr_final)))
print('LDA Test MSE: ', mean_squared_error(Yte, LDA_Yte_pred))
print('LDA Test Error Rate: ', 1 - accuracy_score(Yte, LDA_Yte_pred))
print('LDA Iterations: -\n')

# Naive Bayes
GNB = GaussianNB()
GNB.fit(Xtr_final, Ytr)
GNB_Yte_pred = GNB.predict(Xte_final)
print('Naive Bayes Training MSE: ', mean_squared_error(Ytr, GNB.predict(Xtr_final)))
print('Naive Bayes Test MSE: ', mean_squared_error(Yte, GNB_Yte_pred))
print('Naive Bayes Test Error Rate: ', 1 - accuracy_score(Yte, GNB_Yte_pred))
print('Naive Bayes Iterations: -\n')

# Neural Network
NN = MLPClassifier(solver='lbfgs', alpha=1e-3, hidden_layer_sizes=(7, 3), max_iter=2000, random_state=1)
NN.fit(Xtr_final, Ytr)
NN_Yte_pred = NN.predict(Xte_final)
print('Neural Network Training MSE: ', mean_squared_error(Ytr, NN.predict(Xtr_final)))
print('Neural Network Test MSE: ', mean_squared_error(Yte, NN_Yte_pred))
print('Neural Network Test Error Rate: ', 1 - accuracy_score(Yte, NN_Yte_pred))
print('Neural Network Iterations: ', NN.n_iter_, '\n')

# Decision Tree
DT = DecisionTreeClassifier(random_state=1)
DT.fit(Xtr_final, Ytr)
DT_Yte_pred = DT.predict(Xte_final)
print('Decision Trees Training MSE: ', mean_squared_error(Ytr, DT.predict(Xtr_final)))
print('Decision Trees Test MSE: ', mean_squared_error(Yte, DT_Yte_pred))
print('Decision Trees Test Error Rate: ', 1 - accuracy_score(Yte, DT_Yte_pred))
print('Decision Trees Iterations: -\n')
