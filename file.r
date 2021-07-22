# Primeira questão

numbers <- c(48, 58, 56, 63, 52, 50, 59, 51, 59, 38, 57, 56, 73, 61, 41, 55, 49, 61, 49, 49, 52, 55, 60, 52, 54, 57, 47, 66, 60, 53, 59, 50, 45, 57, 64, 56, 57, 60, 47, 58, 53, 58, 66, 47, 40)

writeLines('Histograma agrupado com frequência absoluta')

png('assets/hist.png')
hist(numbers)

writeLines('Media')
mean(numbers)

writeLines('Moda de czuber')
numbers.table <- table(numbers)
as.numeric(names(numbers.table[numbers.table == max(numbers.table)]))

writeLines('Mediana')
median(numbers)

writeLines('Terceiro Quartil')
quantile(numbers, .75)

writeLines('Percentis 8, 50, 80')
quantile(numbers, probs=c(.08, .50, .80))

png('assets/boxplot.png')
boxplot(numbers, main='Boxplot da lista de numeros arbitrario dado pela atividade')

# Segunda questão

pacients_data <- read.csv('dadosPacientes2021.csv')

png('assets/situacao_paciente.png', width=1600)
barplot(table(pacients_data['situacao_atual']), cex.name=0.95)

png('assets/obito_por_municipio.png', height=600, width=2000)
obito_name <- pacients_data[4, 6]
pacients_data.obito <- pacients_data[pacients_data$situacao_atual == obito_name,]
barplot(table(pacients_data.obito$municipio_residencia), main='Mortos por municipio', las=2, xlab='Cidade', ylab='Mortos', border=TRUE)

pacients_data.obito_idade <- cut(pacients_data.obito$idade, seq(0, 110, by=10))

png('assets/obito_por_sexo_idade.png', width=2000)
barplot(table(pacients_data.obito$sexo, pacients_data.obito_idade), legend=TRUE, xlab='Intervalo de Idade', ylab='Quantidade de Óbitos')

png('assets/obito_por_idade.png')
barplot(table(pacients_data.obito_idade), main='Obito por Idade', xlab='Intervalo de Idade', ylab='Quantidade de Óbitos')

png('assets/obitos_por_mes.png')
barplot(table(cut.Date(as.Date(pacients_data.obito$data_resultado_exame), seq.Date(as.Date('2020-04-01'), as.Date('2021-06-01'), '1 month'))), main='Mortes por mes durante a pandemia', ylab='Mortes', las=2)


# Terceira questão

# Pessoas que tiveram isolamento domiciliar por faixa etária
png('assets/rio_largo_internado.png')
pacients_rio_largo <- pacients_data[pacients_data$municipio_residencia == 'Rio Largo',]
pacients_rio_largo.isolamento <- pacients_rio_largo[pacients_rio_largo$situacao_atual == 'Isolamento Domiciliar',]
pie(table(cut(pacients_rio_largo.isolamento$idade, c(0, 10, 20, 30, 40, 50, 60, 70, 80, 110))), main='Isolamento domiciliar em Rio Largo', sub='Divididos em intervalos de 10 anos por idade', col=c('red', 'orange', 'green', 'blue', 'yellow', 'purple', 'pink', 'brown', 'grey'))


# Pessoas que se recuperaram por sexo
png('assets/rio_largo_recuperaram.png')
pacients_rio_largo.encerramento_isolamento <- pacients_rio_largo[pacients_rio_largo$situacao_atual == 'Encerramento do Isolamento Domiciliar',]
pacients_rio_largo.alta_hospitalar <- pacients_rio_largo[pacients_rio_largo$situacao_atual == 'Alta Hospitalar',]
pacients_rio_largo.recuperaram <- c(pacients_rio_largo.encerramento_isolamento, pacients_rio_largo.alta_hospitalar)
barplot(table(pacients_rio_largo.recuperaram$sexo), col=c('red', 'green'), main='Pessoas que se recuperaram em Rio Largo', sub='Separados por sexo')