# Rééssaie l'action a max fois, avec un délai entre chaque tentative. Utile pour le scrap de serveurs lents.

retry <- function(a, max = 10, init = 0){suppressWarnings(tryCatch({
  Sys.sleep(0.3);
  if(init<max) {a}
}, error=function(e){retry(a, max, init = init+1)}))}

