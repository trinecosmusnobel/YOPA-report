library(RColorBrewer)
library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(scales)

evs.y <- evs.y %>% select(age, country, v72, v73, v75)

percent <- evs.y %>%
  drop_na(v72) %>%
  group_by(country) %>% 
  count(v72) %>% 
  mutate(Percent = n / sum(n)*100)

percent$v72 <- as.numeric(percent$v72)

percent <- percent %>% mutate(v72=recode(v72, 
                                     "1" = "Agree strongly", 
                                     "2" = "Agree",
                                     "3" = "Disagree", 
                                     "4" = "Disagree strongly"))

ggplot() + 
  geom_bar(aes(y = Percent, x = country, fill = v72), 
           data = percent, stat="identity", color = "black") + 
  scale_fill_brewer(palette="Blues", direction = -1) +
  theme_minimal() + 
  coord_flip() + 
  xlab("Country") + 
  ylab("Percentage") +
  labs(fill = element_blank()) +
  labs(title = "When a mother works for pay, the children suffer", plot.title = element_text(hjust=0.5))


percent$Percent <- paste(percent$Percent, "%")
  
  
       