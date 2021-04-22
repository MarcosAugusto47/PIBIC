# Como calcular sMAPE e MASE para todas as séries de M3?
setwd('C:\\Users\\marco\\Desktop\\Estatistica\\PIBIC\\pibic_github')
library(Mcomp)
n = length(M3)

func_sMAPE = function(observados, preditos){
  200*mean( abs(observados - preditos) /
              ( abs(observados) + abs(preditos) )
  )
}

func_MASE = function(observados, preditos, xi, xi_m){
  mean(
    abs(observados - preditos) / 
      mean(abs(xi - xi_m)) 
  )
}
sMAPE = c()
MASE = c()

ind_year = c()
ind_quart = c()
ind_month = c()
ind_other = c()

pb <- winProgressBar(title="Example progress bar", 
                     label="0% done", min=0, max=100, initial=0)
for (j in 1:n) {
  
  ST = M3[[j]] # objeto série temporal j
  mod = auto.arima(ST$x)
  obs = c()
  pred = c()
  xi = c()
  xi_m = c()
  
  if (ST$period == 'YEARLY'){
    ind_year = append(ind_year, j)
    m = 1
    
    pred = forecast(mod,6)[[4]]
    obs = ST$xx
    
    xi = ST$x[(m+1):length(ST$x)]
    xi_m = ST$x[1:(length(ST$x) - m)]
    
  }
  
  else if (ST$period == 'QUARTERLY'){
    ind_quart = append(ind_quart, j)
    m = 4
    
    pred = forecast(mod,8)[[4]]
    obs = ST$xx
    
    xi = ST$x[(m+1):length(ST$x)]
    xi_m = ST$x[1:(length(ST$x) - m)]
    
  }
  
  
  else if (ST$period == 'MONTHLY'){
    ind_month = append(ind_month, j)
    m = 12
    
    pred = forecast(mod,18)[[4]]
    obs = ST$xx
    
    xi = ST$x[(m+1):length(ST$x)]
    xi_m = ST$x[1:(length(ST$x) - m)]
    
  }
  
  
  else if (ST$period == 'OTHER') {
    ind_other = append(ind_other, j)
    m = 1
    
    pred = forecast(mod,8)[[4]]
    obs = ST$xx
    
    xi = ST$x[(m+1):length(ST$x)]
    xi_m = ST$x[1:(length(ST$x) - m)]
    
  }
  
  sMAPE[j] = func_sMAPE(obs, pred)
  MASE[j] = func_MASE(obs, pred, xi, xi_m)
  
  print(j)
  info <- sprintf("%d%% done", round((j/n)*100))
  setWinProgressBar(pb, j/n*100, label= info)
  
}
close(pb)

saveRDS(sMAPE, file = "sMAPE_M3.rds", ascii = FALSE, version = NULL)
saveRDS(MASE, file = "MASE_M3.rds", ascii = FALSE, version = NULL)
saveRDS(ind_year, file = "ind_year.rds", ascii = FALSE, version = NULL)
saveRDS(ind_quart, file = "ind_quart.rds", ascii = FALSE, version = NULL)
saveRDS(ind_month, file = "ind_month.rds", ascii = FALSE, version = NULL)
saveRDS(ind_other, file = "ind_other.rds", ascii = FALSE, version = NULL)
saveRDS(func_sMAPE, file = "Função sMAPE.rds", ascii = FALSE, version = NULL)
saveRDS(func_MASE, file = "Função MASE.rds", ascii = FALSE, version = NULL)