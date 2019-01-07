library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
#Uvoz prve tabele
stolpci_1 <- c("Številka naročila", "Številka uporabnika", "Status naročila", "Čas nakupa", 
               "Odobren čas nakupa", "Čas ko je pošiljko prejel partner", "Dejanski čas dostave", "Predviden čas dostave" )
tabela_narocil <- read_csv("podatki/olist_orders_dataset.csv", na = c("", " ", "NA")) %>% drop_na()
colnames(tabela_narocil) <- stolpci_1


#Uvoz druge tabele
stolpci_2 <- c("Številka naročila", "Zaporedje plačila", "Tip plačila", "Število obrokov plačila", "Vrednost plačila")
tabela_vrst_placil <- read_csv("podatki/olist_order_payments_dataset.csv")
colnames(tabela_vrst_placil) <- stolpci_2


#Uvoz tretje tabele
stolpci_3 <- c("Tip produkta", "Kategorija produkta", "Dolžina naziva produkta", "Dolžina opisa produkta", 
               "Število objavljenih fotografij produkta", "Masa produkta (g)", "Dolžina (cm)", "Višina (cm)", "Širina (cm")
tabela_produktov <- read_csv("podatki/olist_products_dataset.csv", na = c("", " ", "NA")) %>% drop_na() 
colnames(tabela_produktov) <- stolpci_3

#Uvoz četrte tabele
stolpci_4 <- c("Original", "Prevod")
tabela_prevodov <- read_csv("podatki/product_category_name_translation.csv")
colnames(tabela_prevodov) <- stolpci_4


#Združevanje 1. in 2. tabele
narocila <- left_join(tabela_narocil, tabela_vrst_placil, by = c("Številka naročila"), copy=FALSE)

#Združevanje 3. in 4. tabele
produkti <- left_join(tabela_produktov, tabela_prevodov, by = c("Kategorija produkta"="Original"), copy=FALSE)
produkti$`Kategorija produkta` <- NULL
names(produkti)[9] <- c("Kategorija produkta")


