


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
                                numericInput("n_tweets","Numero de tweets",5)
                                
                                ##---------------------------------------------
                                
                                ##TAREA1: Implementar numericInput para numero de filas
                                
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
                                
                                ##---------------------------------------------
                              dateRangeInput("fechas", "Limite"),  
                              sliderInput("num_barra", "Numero breaks", 2, 20, 2)
                              
                            
                              ),
                            mainPanel(
                              plotOutput("fechatweets")
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                                
                                ##---------------------------------------------
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











