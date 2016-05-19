answers <- read.csv("solution.csv", stringsAsFactors = FALSE)

writeFiles = function(x){
  n = nrow(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x$classe[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

writeFiles(answers)

# testing dataset
testDataset <- read.csv("pml-testing.csv.gz", stringsAsFactors = FALSE)

# predictions
library(randomForest)
load("model-rf-cv.rda")
prf <- predict(mod_rf, newdata = testDataset)

write.csv(data.frame(problem_id=testDataset$problem_id, classe=prf),
          file="solution.csv")