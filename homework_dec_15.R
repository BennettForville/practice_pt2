library(tidyr)
print(Loblolly)

#putting data in the wide format, age = column, seed = row
Loblolly %>% pivot_wider(names_from = age, values_from = height)->new_loblolly

#putting data in the wide format, seed = column, age = row
Loblolly %>% pivot_wider(names_from = Seed, values_from = height)

#reverting "new_loblolly" data set back into long form
new_loblolly %>% 
  pivot_longer(-Seed, names_to = "age", values_to = "height")
