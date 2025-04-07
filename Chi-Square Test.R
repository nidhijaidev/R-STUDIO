#Chi- Squared test for Goodness of fit

library(ggplot2)
library(tidyverse)
library(forcats)
View(gss_cat)


my_data <- gss_cat %>%
  select(marital)%>%
  filter(marital %in% c("Married",
                         "Never married",
                         "Divorced")) %>%
  mutate(marital = fct_drop(marital))

my_table <- table(my_data)
View(my_table)


#Use Chi-Squared goodness of fit test

chisq.test(my_table)

my_data %>%
  table() %>%
  chisq.test()


#GRAPHICS

my_data %>%
  ggplot(aes(marital)) + geom_bar()


--------------------------------------------------------------------------------

#Chi- Squared test For Race

my_data <- gss_cat %>%
  select(race)%>%
  filter(race %in% c("White",
                        "Black",
                        "Other")) %>%
  mutate(race = fct_drop(race))

my_table <- table(my_data)
View(my_table)


#Use Chi-Squared FOR RACE
chisq.test(my_table)

my_data %>%
  table() %>%
  chisq.test()

#GRAPHICS FOR RACE

my_data %>%
  ggplot(aes(race)) + geom_bar()

--------------------------------------------------------------------------------
#Chi- Squared test for Partyid
  
my_data <- gss_cat %>%
  select(partyid)%>%
  filter(partyid %in% c("Ind,near rep",
                      "Strong republican",
                      "Not str democrat",
                      "Independent",
                      "Strong democrat")) %>%
  mutate(partyid = fct_drop(partyid))

my_table <- table(my_data)
View(my_table)

#Use Chi-Squared For partyid

chisq.test(my_table)

my_data %>%
  table() %>%
  chisq.test()

#GRAPHICS For partyid

my_data %>%
  ggplot(aes(partyid)) + geom_bar()

  
--------------------------------------------------------------------------------
#Chi- Squared test for Relig

my_data <- gss_cat %>%
  select(relig)%>%
  filter(relig %in% c("Protestant",
                     "Orthodox-christian",
                     "None",
                     "Christian",
                     "Jewish",
                     "Catholic",
                     "Inter-nondenominational",
                     "Hinduism")) %>%
  mutate(relig = fct_drop(relig))

my_table <- table(my_data)
View(my_table)

#Use Chi-Squared For Relig

chisq.test(my_table)

my_data %>%
  table() %>%
  chisq.test()

#GRAPHICS FOR RELIG

my_data %>%
  ggplot(aes(relig)) + geom_bar()

--------------------------------------------------------------------------------

#Chi- Squared test For denom

my_data <- gss_cat %>%
  select(denom)%>%
  filter(denom %in% c("Southern baptist",
                      "Baptist-dk which",
                      "No denomination",
                      "Not applicable",
                      "Lutheran-mo synod",
                      "Other",
                      "United methodist",
                      "Episcopal",
                      "Other lutheran",
                      "Afr meth ep zion",
                      "Presbyterian c in us",
                      "Evangelical luth")) %>%
  mutate(denom = fct_drop(denom))

my_table <- table(my_data)
View(my_table)

#Use Chi-Squared FOR denom

chisq.test(my_table)

my_data %>%
  table() %>%
  chisq.test()

#GRAPHICS FOR denom

my_data %>%
  ggplot(aes(denom)) + geom_bar()





