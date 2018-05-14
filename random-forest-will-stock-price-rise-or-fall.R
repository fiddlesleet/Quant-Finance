# Using K-means clustering to improve Random Forest accuracy 

library(randomForest)
library(Metrics)
library(readr)

###########
# LOAD DATA
###########

# 3000 stocks on 100 metrics: Download data: https://drive.google.com/file/d/0ByPBn4rtMQ5HaVFITnBObXdtVUU/view 
df <- read_csv("stock_data.csv")
# inspect
df

# specify outcome variable as factor
df$Y <- as.factor(df$Y)

##################################
# DIVIDE DATASET INTO TEST & TRAIN
##################################

set.seed(101)
train <- df[1:2000,]
test <- df[2001:3000,]

###############
# ROUND 1: RANDOM FOREST
###############

model_rf <- randomForest(Y~., data = train)
preds <- predict(object = model_rf,
                 test[, -101])
#inspect
table(preds)

# check accuracy
auc(preds, test$Y) # .46

#####################################################################################
# ROUND 2: MAKE 5 CLUSTERS BASED ON INDEPENDENT VARIABLES, THEN REAPPLY RANDOM FOREST
#####################################################################################

# create 5 clusters using k-means clustering
cluster <- kmeans(df[, -101], 5)

# add clusters as independent variable to the dataset
df$cluster <- as.factor(cluster$cluster)
# inspect
df

# separate dataset into test & train
train <- df[1:2000,]
test <- df[2001:3000,]

# apply random forest
model_rf <- randomForest(Y~., data = train)
preds2 <- predict(object = model_rf,
                  test[, -101])
table(preds2)

# get accuracy
auc(preds2, test$Y) # 50% whoot 
