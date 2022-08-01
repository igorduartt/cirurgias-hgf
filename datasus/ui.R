library('shiny')
library('shinythemes')

fluidPage(
  theme = shinytheme("spacelab"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("start_year", label = ("Ano de Início"),
                   choices = list("2017" = 2017, "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021, "2022" = 2022), 
                   selected = 2017),
      
      selectInput("end_year", label = ("Ano Final"),
                  choices = list("2017" = 2017, "2018" = 2018, "2019" = 2019, "2020" = 2020, "2021" = 2021, "2022" = 2022), 
                  selected = 2017),
      
      selectInput("start_month", label = ("Mês Inicial"),
                  choices = list("Jan" = 1, "Fev" = 2, "Mar" = 3, "Abr" = 4, "Mai" = 5, "Jun" = 6, "Jul" = 7, "Ago" = 8, "Set" = 9, "Out" = 10, "Nov" = 11, "Dez" = 12), 
                  selected = 1),
      
      selectInput("end_month", label = ("Mês Final"),
                  choices = list("Jan" = 1, "Fev" = 2, "Mar" = 3, "Abr" = 4, "Mai" = 5, "Jun" = 6, "Jul" = 7, "Ago" = 8, "Set" = 9, "Out" = 10, "Nov" = 11, "Dez" = 12), 
                  selected = 1),
      
      selectInput("state", label = ("Estado"),
                  choices = list("CE" = "CE", "RS" = "RS"), 
                  selected = 1),
      
      selectInput("system", label = ("Sistema do DATASUS"),
                  choices = list("SIH-RD" = "SIH-RD"), 
                  selected = "SIH-RD"),
      
      checkboxInput("checkbox", label = "Processar Cirurgias", value = TRUE),
      
      
      actionButton("do", "Baixar Dados") 
      
      
    ),
  
  
    mainPanel(
      
      downloadButton('downloadData', 'Exportar Dados')
    
    )
  
  ),


)