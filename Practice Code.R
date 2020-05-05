## Week 1 practice
# Exploratory graphs
microb <- read.csv("microb.csv", skip = 1, colClasses = c("character", "character","character","character", rep("numeric",319)))
microb <- microb[-c(16,41),]
names(microb)
# check for missing values in Gender
sum(is.na(microb$Gender))
# explore Bacteroidetes
## five number summary
summary(microb$Bacteroidetes)
## Box plot
boxplot(microb$Bacteroidetes, col = "red")

par(mfrow=c(1,3), mar=c(2,4,4,1))
with(subset(microb, Treatment == "Con"), boxplot(Streptococcaceae ~ Treatment, data = microb, col= "green", ylab = "Streptococcaceae", main="CON"))
boxplot(Streptococcaceae ~ Treatment, data = microb, col= "green", ylab = "Streptococcaceae")
boxplot(Peptostreptococcaceae ~ Treatment, data = microb, col= "green")
boxplot(Desulfovibrionaceae ~ Treatment, data = microb, col= "red")

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Bifidobacterium ~ Treatment, data = microb, ylab = "Bifidobacterium")
boxplot(Adlercreutzia ~ Treatment, data = microb)
boxplot(Prevotella ~ Treatment, data = microb)

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Streptococcus ~ Treatment, data = microb, ylab = "Streptococcus")
boxplot(Akkermansia ~ Treatment, data = microb)
boxplot(Lactobacillus ~ Treatment, data = microb)

par(mfrow=c(1,1), mar=c(4,4,4,4))
boxplot(Bifidobacteriales ~ Treatment, data = microb, main= "All")


par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Adlercreutzia ~ Treatment, data = microb, main= "All")
with(subset(microb, Gender == "M"), plot(Treatment, Adlercreutzia, main = "M", ylab = "Adlercreutzia"))
with(subset(microb, Gender == "F"), plot(Treatment, Adlercreutzia, main = "F", ylab = "Adlercreutzia"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Prevotella ~ Treatment, data = microb, main= "All")
with(subset(microb, Gender == "M"), plot(Treatment, Prevotella, main = "M", ylab = "Prevotella"))
with(subset(microb, Gender == "F"), plot(Treatment, Prevotella, main = "F", ylab = "Prevotella"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Enterococcus ~ Treatment, data = microb, main= "All")
with(subset(microb, Gender == "M"), plot(Treatment, Enterococcus, main = "M", ylab = "Enterococcus"))
with(subset(microb, Gender == "F"), plot(Treatment, Enterococcus, main = "F", ylab = "Enterococcus"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Streptococcus ~ Treatment, data = microb, main= "All")
with(subset(microb, Gender == "M"), plot(Treatment, Streptococcus, main = "M", ylab = "Streptococcus"))
with(subset(microb, Gender == "F"), plot(Treatment, Streptococcus, main = "F", ylab = "Streptococcus"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Akkermansia ~ Treatment, data = microb, main= "All")
with(subset(microb, Gender == "M"), plot(Treatment, Akkermansia, main = "M", ylab = "Akkermansia"))
with(subset(microb, Gender == "F"), plot(Treatment, Akkermansia, main = "F", ylab = "Akkermansia"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Fusobacterium ~ Treatment, data = microb, main= "All")
with(subset(microb, Gender == "M"), plot(Treatment, Fusobacterium, main = "M", ylab = "Fusobacterium"))
with(subset(microb, Gender == "F"), plot(Treatment, Fusobacterium, main = "F", ylab = "Fusobacterium"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Actinobacteria ~ Treatment, data = microb, main= "All", col = "green")
with(subset(microb, Gender == "M"), plot(Treatment, Actinobacteria, main = "M", ylab = "Actinobacteria", col = "green"))
with(subset(microb, Gender == "F"), plot(Treatment, Actinobacteria, main = "F", ylab = "Actinobacteria", col = "green"))

par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Alphaproteobacteria ~ Treatment, data = microb, main= "All", col = "green")
with(subset(microb, Gender == "M"), plot(Treatment, Alphaproteobacteria, main = "M", ylab = "Alphaproteobacteria", col = "green"))
with(subset(microb, Gender == "F"), plot(Treatment, Alphaproteobacteria, main = "F", ylab = "Alphaproteobacteria", col = "green"))

# exclude the row where Alphaproteobacteria > 0.8
alpha <- microb[!(microb$Alphaproteobacteria > 0.8),]
boxplot(Alphaproteobacteria ~ Treatment, data = alpha, main= "All", col = "green")
with(subset(alpha, Gender == "M"), plot(Treatment, Alphaproteobacteria, main = "M", ylab = "Alphaproteobacteria", col = "green"))
with(subset(alpha, Gender == "F"), plot(Treatment, Alphaproteobacteria, main = "F", ylab = "Alphaproteobacteria", col = "green"))


par(mfrow=c(1,3), mar=c(2,4,4,1))
boxplot(Deltaproteobacteria ~ Treatment, data = microb, main= "All", col = "red")
with(subset(microb, Gender == "M"), plot(Treatment, Deltaproteobacteria, main = "M", ylab = "Deltaproteobacteria", col = "red"))
with(subset(microb, Gender == "F"), plot(Treatment, Deltaproteobacteria, main = "F", ylab = "Deltaproteobacteria", col = "red"))

par(mfrow=c(1,1), mar= c(5,4,2,1))
with(microb, plot(Firmicutes, Bacteroidetes, col = Treatment))
model <- lm(Firmicutes~Bacteroidetes, microb)
abline(model, lwd=2)
par(mfrow=c(1,2), mar= c(5,4,2,1))
with(subset(microb, Treatment == "Con"), plot(Firmicutes, Bacteroidetes, main = "CON"))
with(subset(microb, Treatment == "DHA"), plot(Firmicutes, Bacteroidetes, main = "DHA"))
cor.test(microb$Firmicutes, microb$Bacteroidetes)

# explore exam5 final score of FDNS3100
#density smooth
score <- read.csv("Exam 5 final score.csv")
qplot(final.score, data = score, geom = "density")
qplot(final.score, data = score)

ggplot() + 
    geom_density(data=score, aes(final.score)) +
     geom_density(data=score, aes(part.1)) +
                   geom_density(data=score, aes(part.2))
















