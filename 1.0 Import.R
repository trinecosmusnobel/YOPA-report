source("0.0 Library.R")

evs <- read_dta("ZA7500_v4-0-0.dta")

evs <- evs %>% 
  mutate_all(funs(replace(., .<0, NA)))

evs$country <- as.numeric(evs$country)

evs <- evs %>% filter(country %in% c(208, 
                                     246, 
                                     352, 
                                     578, 
                                     752))

evs <- evs %>% mutate(country=recode(country, 
                         `208`="Denmark",
                         `246`="Finland",
                         `352`="Iceland",
                         `578`="Norway",
                         `752`="Sweden",
                         ))

evs.y <- evs %>% filter(age <= 30)

#Jeg skal bruge følgende variable: 

evs$v72 #child suffers with working mother
evs$v73 #women really want home and children
evs$v75 #A man's job is to earn money; a woman's job is to look after the home and family




