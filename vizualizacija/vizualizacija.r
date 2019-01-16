library(ggplot2)
library(reshape2)

## 1. tipi plačila
graf_tip_placila <- ggplot(narocila, aes(narocila$tip.placila)) + geom_bar(labels = c("boleto", "kreditne kartice", "debetne kartice", "bon")) + 
  labs(title = "Plačilna sredstva", x = "Tip plačilnega sredstva", y = "Število nakupov") + scale_x_discrete(labels = c("boleto", "kreditne kartice", "debetne kartice", "bon"))


## 2. Kategorije izdelkov
graf_kategorije_izdelkov <- ggplot(izdelki, aes(izdelki$prevod)) + geom_bar()


## 3. Porazdeljenost cen
graf_porazdelitve_cen <- ggplot(narocila, aes(narocila$vrednost.placila)) + geom_density() + scale_x_log10() + labs(title = "Porazdelitev vrednosti nakupov", x = "Vrednost plačila (log)", y = "Delež naročil")


## 4. Pregled prometa v letu 2017
meseci <- c("Januar", "Februar", "Marec", "April", "Maj", "Junij", "Julij", "Avgust", "September", "Oktober", "November", "December")
graf_promet_2017 <- ggplot(promet_2017, aes(x = promet_2017$mesec.dostave, y = promet_2017$vrednost.placila / 1000)) + geom_col() + 
  labs(title = "Pregled prometa v letu 2017", x = "Mesec", y = "Skupni promet (v 1000€)") + scale_x_continuous(breaks = 1:12, labels = meseci )

## 5. Pregled prometa v decembru 2017
graf_december <- ggplot(december, aes(x=december$dan.narocila, y = december$vrednost.placila)) + geom_col() + 
  labs(title = "Pregled prometa v decembru 2017", x = "Dan", y = "Skupni promet") + scale_x_continuous(breaks = 1:31)

## 6. Pregled prometa v novembru 2017
graf_november <- ggplot(november, aes(x=november$dan.narocila, y=november$vrednost.placila)) + geom_col() +
  labs(title = "Pregled prometa v novembru 2017", x = "Dan", y = "Skupni promet") + scale_x_continuous(breaks = 1:30)
  
  

## TODO: graf porazdelitve za vsako metodo posebej
## TODO: zemljevid uvozi (vizualizacije naročil)
## TODO: Analiza odvisnosti