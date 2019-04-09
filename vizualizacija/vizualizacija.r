library(ggplot2)
library(reshape2)

meseci <- c("Januar", "Februar", "Marec", "April", "Maj", "Junij", "Julij", "Avgust", "September", "Oktober", "November", "December")
graf_promet <- ggplot(promet_2017, aes(x = promet_2017$mesec.dostave, y = promet_2017$vrednost.placila / 1000)) + geom_col() + 
  labs(title = "Pregled prometa v letu 2017", x = "Mesec", y = "Skupni promet (v 1000€)") + scale_x_continuous(breaks = 1:12, labels = meseci )

graf_tipi <- ggplot(narocila, aes(narocila$tip.placila)) + geom_bar() +
  labs(title = "Plačilna sredstva", x = "Tip plačilnega sredstva", y = "Število nakupov") + scale_x_discrete() + coord_flip()

graf_gostot <- ggplot(narocila, aes(x = narocila$vrednost.placila, color=narocila$tip.placila)) + geom_density()  + scale_x_log10()

graf_december <- ggplot(december, aes(x=december$dan.narocila, y = december$vrednost.placila)) + geom_col() +
  labs(title = "Pregled prometa v decembru 2017", x = "Dan", y = "Skupni promet") + scale_x_continuous(breaks = 1:31)

graf_november <- ggplot(november, aes(x=november$dan.narocila, y=november$vrednost.placila)) + geom_col() +
  labs(title = "Pregled prometa v novembru 2017", x = "Dan", y = "Skupni promet") + scale_x_continuous(breaks = 1:30)


# TODO: popravi pozicioniranje grafov
# TODO: uvozi zemljevid