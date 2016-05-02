

library(shiny)
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
                                
                                numericInput("in_number", "número de filas", 1)
                                
                                
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
                                
                                
                                sliderInput("num_barra", "número de barras", 2, 20, 2),
                                dateRangeInput("restriccion", "limite")
                                ##---------------------------------------------
                                ),
                            mainPanel(
                              plotOutput("fecha")
                              
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                
                                ##---------------------------------------------
                              
                              
                              
                              
                              
                              
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











