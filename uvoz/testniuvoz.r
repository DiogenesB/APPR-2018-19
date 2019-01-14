library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
#Uvoz prve tabele
stolpci_1 <- c("kljuc.narocila", "kljuc.uporabnika", "status.narocila", "cas.nakupa", 
               "odobren.cas.nakupa", "cas.ko.je.posiljko.prejel.partner", "dejanski.cas.dostave", "predviden.cas.dostave" )
tabela_narocil <- read_csv("podatki/olist_orders_dataset.csv", na = c("", " ", "NA")) %>% drop_na()
colnames(tabela_narocil) <- stolpci_1


#Uvoz druge tabele
stolpci_2 <- c("kljuc.narocila", "zaporedje.placila", "tip.placila", "stevilo.obrokov.placila", "vrednost.placila")
tabela_vrst_placil <- read_csv("podatki/olist_order_payments_dataset.csv")
colnames(tabela_vrst_placil) <- stolpci_2


#Uvoz tretje tabele
stolpci_3 <- c("kljuc.izdelka", "kategorija.izdelka", "dolzina.naziva.izdelka", "dolzina.opisa.izdelka", 
               "stevilo.objavljenih.fotografij.izdelka", "masa.izdelka (g)", "dolzina", "visina", "sirina")
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

