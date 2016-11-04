library(ggplot2)

# Load profiles data
profiles = read.csv("/home/adrian/Desktop/MASTER/ScientificWriting/london-borough-profiles-15-16.csv")
profiles = profiles[1:33,]

# Load crimes data
crimes = read.csv("/home/adrian/Desktop/MASTER/ScientificWriting/london-borough-crime-15-16.csv",
                  stringsAsFactors = FALSE)

# Merge datasets
data = merge.data.frame(profiles, crimes, by.x=c("Area.name"), by.y=c("Borough"))

# Normalize crimes by 100k citizens
sapply(crimes, function(x){sapply(x, is.numeric)/profiles$GLA.Population.Estimate.2015[as.character(profiles$Area.name)==as.character(x['Borough'])]})


data = transform(data, Murder = (Murder / GLA.Population.Estimate.2015)*100000)




# Visualize
