# Using R
# Option 1: tidytuesdayR R package 
## install.packages("tidytuesdayR")
if( !require(GGally)){
  install.packages("GGally")
}
if( !require(tidyverse)){
  install.packages("tidyverse")
}

data_url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-04-01/pokemon_df.csv'
pokemon <- readr::read_csv(data_url, col_select = c("id", "pokemon", "type_1", "type_2",  "hp", "attack", "defense", "special_attack", "special_defense", "speed"))
NewNames <- c('Number', 'Names', 'Type1', 'Type2', 'HP', 'Attack', 'Defense', 'SpAttack', 'SpDefense', 'Speed')
names(pokemon) <- NewNames

cols_to_check <- c("HP", "Attack", "Defense", "SpAttack", "SpDefense", "Speed")
pokemon[, cols_to_check]


fig1 <- ggplot(data=pokemon, mapping=aes(x=Attack, y=Defense, color=Type1))+
  geom_boxplot()+
  coord_flip()

fig2 <- ggpairs(pokemon, columns = 5:10)


## Linear regression
model1= lm(HP ~ Speed + Attack + Defense + SpAttack + SpDefense, data=pokemon)

tbl1 <- summary(model1)$coefficients
