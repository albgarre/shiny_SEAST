

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
                                
                                numericInput("n_rows", "Numero de filas", 5)
                                
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
                                
                                dateRangeInput("limits", "Limites", start = "2016-04-18", end = "2016-05-01"),
                                sliderInput("n_breaks", "Numero de breaks", 2, 20, 5)
                                
                                ##---------------------------------------------
                                ),
                            mainPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                
                                plotOutput("diagram")
                                
                                ##---------------------------------------------
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











