

library(shiny)

#------------------------------------------------------------------------------

shinyUI(
    
    ## Barra de navegacion
    
    navbarPage("GoTSeason6",
               
               ## Panel 1
               
               tabPanel(" Data Input",
                        sidebarLayout(
                            sidebarPanel(
                                fileInput("in_file", "Selecciona archivo"),
                                
                                ##---------------------------------------------
                                
                                ##TAREA1: Implementar numericInput para numero de filas
                            
                                ##---------------------------------------------
                            
                                  numericInput("rows", "Filas", 5)
                                
                                
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
                                
                                ##---------------------------------------------
                                dateRangeInput("fechas","Límites","2016-04-22","2016-05-01"),
                                
                                sliderInput("n_breaks", "Numeros de breaks", 2, 20, 10)
                                
                                ),
                            mainPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                
                                ##---------------------------------------------
                                
                                plotOutput("evolucion_hist")
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











