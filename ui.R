

library(shiny)

#------------------------------------------------------------------------------

shinyUI(
    
    ## Barra de navegacion
    
    navbarPage("GoTSeason6_Tweets",
               
               ## Panel 1
               
               tabPanel("Tabla",
                        sidebarLayout(
                            sidebarPanel(
                                fileInput("in_file", "Selecciona archivo"),
                                
                                ##---------------------------------------------
                                
                                ##TAREA1: Implementar numericInput para numero de filas
                                numericInput("in_nro_tweets", "Numero de tweets", 5, min = 1, max =50)
                                
                                ##---------------------------------------------
                                
                            ),
                            mainPanel(
                                tableOutput("tweets")
                            )
                        )
               ),
               
               ## Panel 2
               
               tabPanel("Rezultados",
                        sidebarLayout(
                            sidebarPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar dateRangeInput
                              dateRangeInput("fechas", 
                                             "Límites", 
                                             start = "2015-04-22", 
                                             end = "2016-04-25"),
                              
                              sliderInput("breaks",
                                          "Número breaks",
                                          min = 2,
                                          max = 20,
                                          value = 5)
                              
                                ##---------------------------------------------
                                ),
                            mainPanel(
                                ##---------------------------------------------
                                
                                ##TAREA2: Implementar grafico de evolucion
                              plotOutput("grafico_evolucion")
                                ##---------------------------------------------
                                )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











