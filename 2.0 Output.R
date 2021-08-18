source("1.0 Import.R")

evs.y <- evs.y %>% select(age, country, v72, v73, v75, v225, v234, v243_r, v260)

evs.y$v73 <- as.factor(evs.y$v73)
evs.y$v75 <- as.factor(evs.y$v75)
evs.y$v72 <- as.factor(evs.y$v72)

evs.y <- evs.y %>% mutate(v72=recode(v72, 
                                         "1" = "Agree strongly", 
                                         "2" = "Agree",
                                         "3" = "Disagree", 
                                         "4" = "Disagree strongly"))

evs.y <- evs.y %>% mutate(v73=recode(v73, 
                                         "1" = "Agree strongly", 
                                         "2" = "Agree",
                                         "3" = "Disagree", 
                                         "4" = "Disagree strongly"))

evs.y <- evs.y %>% mutate(v75=recode(v75, 
                                         "1" = "Agree strongly", 
                                         "2" = "Agree",
                                         "3" = "Disagree", 
                                         "4" = "Disagree strongly"))

#v72 - When a mother works, the children suffer
percent.72 <- evs.y %>%
  drop_na(v72) %>%
  group_by(country) %>% 
  count(v72) %>% 
  mutate(Percent = n / sum(n)*100)

v72.barchart.countries <- ggplot() + 
  geom_bar(aes(y = Percent, x = country, fill = v72), 
           data = percent.72, stat="identity", color = "black") + 
  scale_fill_brewer(palette="Blues", direction = -1) +
  theme_minimal() + 
  coord_flip() + 
  xlab("") + 
  ylab("Percentage") +
  labs(fill = element_blank()) +
  ggtitle("When a mother works, \n the children suffer") +
  theme(plot.title = element_text(hjust = 0.5), legend.position="right") 

ggsave("v72.barchart.countries.png", 
       plot = v72.barchart.countries,
       path = "Plots/", 
       width = 15, 
       height = 5,
       units = "cm", 
       dpi = 275)

#v72 - A job is alright but what most women really want is a home and children
percent.73 <- evs.y %>%
  drop_na(v73) %>%
  group_by(country) %>% 
  count(v73) %>% 
  mutate(Percent = n / sum(n)*100)

v73.barchart.countries <- ggplot() + 
  geom_bar(aes(y = Percent, x = country, fill = v73), 
           data = percent.73, stat="identity", color = "black") + 
  scale_fill_brewer(palette="Blues", direction = -1) +
  theme_minimal() + 
  coord_flip() + 
  xlab("Country") + 
  ylab("Percentage") +
  labs(fill = element_blank()) +
  ggtitle("A job is alright but what most women \n really want is a home and children") +
  theme(plot.title = element_text(hjust = 0.5), legend.position="right") 

ggsave("v73.barchart.countries.png", 
       plot = v73.barchart.countries,
       path = "Plots/", 
       width = 15, 
       height = 5,
       units = "cm", 
       dpi = 275)

#v75 - A job is alright but what most women really want is a home and children
percent.75 <- evs.y %>%
  drop_na(v75) %>%
  group_by(country) %>% 
  count(v75) %>% 
  mutate(Percent = n / sum(n)*100)

v75.barchart.countries <- ggplot() + 
  geom_bar(aes(y = Percent, x = country, fill = v75), 
           data = percent.75, stat="identity", color = "black") + 
  scale_fill_brewer(palette="Blues", direction = -1) +
  theme_minimal() + 
  coord_flip() + 
  xlab("Country") + 
  ylab("Percentage") +
  labs(fill = element_blank()) +
  ggtitle("A man's job is to earn money; a woman's \n job is to look after the home and family") +
  theme(plot.title = element_text(hjust = 0.5), legend.position="right") 

ggsave("v75.barchart.countries.png", 
       plot = v75.barchart.countries,
       path = "Plots/", 
       width = 15, 
       height = 5,
       units = "cm", 
       dpi = 275)



