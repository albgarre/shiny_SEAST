

library(shiny)

#------------------------------------------------------------------------------

shinyUI(
    
    ## Barra de navegacion
    
    navbarPage("GoT",
               
               ## Panel 1
               
               tabPanel("Panel 1",
                        sidebarLayout(
                            sidebarPanel(
                                fileInput("in_file", "Selecciona archivo"),
                                
                                ##---------------------------------------------
                                
                                ##TAREA1: Implementar numericInput para numero de filas
                                numericInput("numt", "Numero_Tweets:", 10, min = 1, max = 100),
                                verbatimTextOutput("value")
                                
                                
                            
                                ##---------------------------------------------
                                
                            ),
                            mainPanel(
                                tableOutput("tweets")
                            )
                      ) 
               ),
               
               ## Panel 2
               
               tabPanel("Panel 2",
                        sidebarLayout(
                            sidebarPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar dateRangeInput
                                dateRangeInput("daterange1", "Limites:",
                                               start = "2016-04-18",
                                               end   = "2016-4-30")
                                ,
                                sliderInput("numbreaks", "Numero de breaks", 2, 20, 5)
                                ##---------------------------------------------
                                ),
                            mainPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                plotOutput("diagrama")
                                ##---------------------------------------------
                                )
                        )
               )
               
 
               )   )  ##-- Fin navbarPage #GoTSeason6












