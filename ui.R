

library(shiny)
library(dplyr)
library(ggplot2)

#------------------------------------------------------------------------------

shinyUI(
    
    ## Barra de navegacion
    
    navbarPage("#GoTSeason6",
               
               ## Panel 1
               
               tabPanel("Data Input",
                        sidebarLayout(
                            sidebarPanel(
                                fileInput("in_file", "Selecciona archivo"),
                                
                                ##---------------------------------------------
                                
                                ##TAREA1: Implementar numericInput para numero de filas
                                
                                numericInput("n_tweets",
                                             "Numero de tweets", 
                                             5, 
                                             min=1, 
                                             max= 10)
                                
                                ##---------------------------------------------
                                
                            ),
                            mainPanel(
                                tableOutput("tweets")
                            )
                        )
               ),
               
               ## Panel 2
               
               tabPanel("Resultados",
                        sidebarLayout(
                            sidebarPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar dateRangeInput
                                
                                dateRangeInput("daterange", 
                                               label = "Limites",
                                               start = "2016-04-18",
                                               end = "2016-04-30"),
                                
                                sliderInput("slider",
                                            label = "Numero breaks",
                                            min = 2,
                                            max = 20,
                                            value = 5)
                                
                                ##---------------------------------------------
                                ),
                            mainPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                plotOutput('grafico_output')
                               
                                ##---------------------------------------------
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











