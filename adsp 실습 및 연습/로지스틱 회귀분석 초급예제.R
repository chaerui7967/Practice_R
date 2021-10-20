#로지스틱 회귀분석 - 림프절이 전립선 암에 대해 양성 여부를 예측하는가

library(boot)
data(nodal)
a<-c(2,4,6,7) #필요한 열만 추출
data<-nodal[,a]

glmModel <- glm(r~., data = data, family = "binomial")
summary(glmModel)
