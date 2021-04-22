# Um estudo sobre os modelos ARIMA e sua capacidade preditiva para dados de competição de previsão de séries temporais

## Esse foi um projeto de iniciação científica que trabalhei no ano de 2019.
A utilização de modelos preditivos em séries temporais assume fundamental importância, para o planejamento operacional de diversas empresas que buscam antecipar e tomar proveito de eventos futuros. Além disso, vale ressaltar que esse tipo de modelagem também é indispensável para estudar fenômenos da natureza, como previsão do tempo, ocorrência de chuvas, mudanças no nível de água de rios e de mares e etc. Sendo assim, é ponto pacífico dizer que é de grande interesse econômico e científico, estudar e aprimorar tais métodos.

Nesse cenário, a família de modelos estatísticos ARIMA/SARIMA assume destaque e, à vista disso, este projeto visa estudá-la e analisar sua capacidade preditiva, com autilização da função auto.arima() do pacote forecast do software R . Baseado em diversos critérios técnicos, esta função seleciona automaticamente o melhor modelo entreaqueles pertencentes a família do modelo.

Para tal fim, utilizou-se o conjunto de dados da competição de previsão de séries temporais M3 [6], que foi um evento em que diversos profissionais e pesquisadores de diferentes áreas competiram para tentar obter as melhores previsões, para mais de 3000 séries temporais.

Caso você tenha interesse em entender o código usado para esse projeto, sugiro que você primeiro rode o código **get_index.R**. Depois,  rode **PIBIC_Relario_Final.Rmd**, que é arquivo em RMarkdown que calcula todos os resultados presentes nas tabelas do relatório **PIBIC_Relatorio_Final.pdf**
