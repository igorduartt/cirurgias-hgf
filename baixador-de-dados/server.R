#load_libraries <- function(){
  #if (!require("microdatasus"))
    #install.packages("microdatasus"); library(microdatasus)
  #if (!require("csapAIH"))
    #install.packages("cxxsapAIH"); library(csapAIH)
#}
#load_libraries()


library(shiny)
library(csapAIH)
library(microdatasus)
library(dplyr)
library(bslib)
library(devtools)
library(remotes)


function(input, output, session) {
  
  observeEvent(input$do, {
    withProgress(message = 'Aguarde...', {
    dados <<- fetch_datasus(year_start = input$start_year,  year_end = input$end_year, month_start = input$start_month, 
                            month_end = input$end_month, uf = input$state, information_system = input$system)
    if(input$checkbox == TRUE){
      csap <- csapAIH::csapAIH(dados) %>% rename(N_AIH = n.aih)
      dados <<- merge(x=dados,y=csap,by="N_AIH")
      dados <<- filter(dados, csap == "sim")
    }
    }
    )
  }
  )
  
  
  output$downloadData <- downloadHandler(
    
    filename = function() { 
      paste("dataset-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(dados, file, fileEncoding  = "ISO-8859-1")
    })
  
 
}