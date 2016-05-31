

library(shiny)

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
                                
                                numericInput("in_n", "Número de tweets", 5, min = 1, max =50)
                                
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
                                               "Límites", 
                                               start = "2016-04-22", 
                                               end = "2016-04-25"),
                                
                                sliderInput("sliderinput",
                                            "Número breaks",
                                            min = 2,
                                            max = 20,
                                            value = 11)
                                
                                ##---------------------------------------------
                                ),
                            mainPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                  plotOutput("histograma")
                                ##---------------------------------------------
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











