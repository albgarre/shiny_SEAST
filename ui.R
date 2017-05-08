

library(shiny)

#------------------------------------------------------------------------------

shinyUI(
    
    ## Barra de navegacion
    
    navbarPage("#GoTSeason6",
               
               ## Panel 1
               
               tabPanel("Data_input",
                        sidebarLayout(
                            sidebarPanel(
                                fileInput("in_file", "Selecciona archivo"),
                                
                                
                                ##TAREA1: Implementar numericInput para numero de filas
                                
                                numericInput("in_number", "Numero de tweets", 0)
                                
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
                              
                                ##TAREA2: Implementar dateRangeInput
                                dateRangeInput("restriccion", "Tweets mostrados en el gráfico de barras"),
                                sliderInput("barra", "Numero de pares de barras", 0, 20, 2)
                                
                                
                                ),
                            mainPanel(
                              
                                ##TAREA2: Implementar grafico de evolucion
                                plotOutput("grafica")
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











