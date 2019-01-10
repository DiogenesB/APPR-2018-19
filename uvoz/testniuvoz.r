library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
#Uvoz prve tabele
stolpci_1 <- c("ključ.naročila", "ključ.uporabnika", "status.naročila", "čas.nakupa", 
               "odobren.čas.nakupa", "čas.ko.je.pošiljko.prejel.partner", "dejanski.čas.dostave", "predviden.čas.dostave" )
tabela_narocil <- read_csv("podatki/olist_orders_dataset.csv", na = c("", " ", "NA")) %>% drop_na()
colnames(tabela_narocil) <- stolpci_1


#Uvoz druge tabele
stolpci_2 <- c("ključ.naročila", "zaporedje.plačila", "tip.plačila", "število.obrokov.plačila", "vrednost.plačila")
tabela_vrst_placil <- read_csv("podatki/olist_order_payments_dataset.csv")
colnames(tabela_vrst_placil) <- stolpci_2


#Uvoz tretje tabele
stolpci_3 <- c("ključ.izdelka", "kategorija.izdelka", "dolžina.naziva.izdelka", "dolžina.opisa.izdelka", 
               "število.objavljenih.fotografij.izdelka", "masa.izdelka (g)", "dolžina (cm)", "višina (cm)", "širina (cm")
tabela_produktov <- read_csv("podatki/olist_products_dataset.csv", na = c("", " ", "NA")) %>% drop_na() 
colnames(tabela_produktov) <- stolpci_3

#Uvoz četrte tabele
stolpci_4 <- c("original", "prevod")
tabela_prevodov <- read_csv("podatki/product_category_name_translation.csv")
colnames(tabela_prevodov) <- stolpci_4


#Združevanje 1. in 2. tabele
narocila <- left_join(tabela_narocil, tabela_vrst_placil, by = c("ključ.naročila"), copy=FALSE)
narocila$`Status naročila` <- as.factor(narocila$`Status naročila`)

#Združevanje 3. in 4. tabele
produkti <- left_join(tabela_produktov, tabela_prevodov, by = c("kategorija.produkta"="original"), copy=FALSE)
produkti$kategorija.izdelka <- NULL
produkti$dolžina.naziva.izdelka <- NULL
produkti$dolžina.opisa.izdelka<- NULL
produkti$število.objavljenih.fotografij.izdelka <- NULL
names(produkti)[6] <- c("kategorija.produkta")

