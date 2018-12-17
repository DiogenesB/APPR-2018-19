library(readr)
library(tidyr)
library(dplyr)
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
tabela_produktov <- read_csv("podatki/olist_products_dataset.csv", na = c("", " ", "NA"))
colnames(tabela_produktov) <- stolpci_3
tabela_produktov <- drop_na(tabela_produktov)
