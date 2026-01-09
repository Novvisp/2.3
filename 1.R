pdf("2.3.pdf")

bball <- read.csv("ppg2008.csv", sep = ",", header = TRUE)

rownames(bball) <- bball$Name  

bball <- bball[, 2:20]        

bball_matrix <- data.matrix(bball)

library(RColorBrewer)

heatmap(
  bball_matrix,
  Rowv = NA, Colv = NA,
  col = brewer.pal(9, "YlOrRd"),
  scale = "column",
  margins = c(5, 10),
  main = "NBA stats heatmap"
)

library(aplpack)

bball_subset <- bball[, 1:15]
faces(
  bball_subset,
  ncolors = 0,
  cex = 0.8,
  main = "Chernoff Faces: NBA players (subset)"
)


crime <- read.csv("crimeRatesByState2005.csv", sep = ",", header = TRUE)

rownames(crime) <- crime$state

crime_subset <- crime[, 2:7]

faces(
  crime_subset,
  ncolors = 0,
  cex = 0.8,
  main = "Chernoff Faces: Crime rates by state"
)


stars(
  crime_subset,
  flip.labels = FALSE,
  key.loc = c(15, 1.5),
  main = "Stars plot: Crime rates by state"
)

stars(
      crime_subset,
      flip.labels=FALSE,
      key.loc = c(15, 1.5),
      full=FALSE,
      main = "Stars plot not Full: Crime rates by state"
)

stars(
  crime_subset,
  flip.labels=FALSE,
  key.loc = c(15, 1.5),
  draw.segments=TRUE,
  main = "Stars plot Draw Segments: Crime rates by state"
)


dev.off()
