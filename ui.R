#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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
                          
                          ##---------------------------------------------
                          numericInput("num_teewts", "Numero de tweets", 2, min=1, max=20)
                          
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
                          dateRangeInput("Date", "Limites", start = "2016-04-18", end = "2016-05-01", min = NULL,
                                         max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0,
                                         language = "en", separator = " to ", width = NULL),
                          sliderInput("num", "Numero Breaks", 2, 20, 2, step = NULL, round = FALSE,
                                      format = NULL, locale = NULL, ticks = TRUE, animate = FALSE,
                                      width = NULL, sep = ",", pre = NULL, post = NULL, timeFormat = NULL,
                                      timezone = NULL, dragRange = TRUE)
                          
                          
                        ),
                        mainPanel(
                          ##---------------------------------------------
                          
                          ##TAREA2: Implementar grafico de evolucion
                          
                          ##---------------------------------------------
                         
                          plotOutput(outputId = "out_histogram", height = "300px")
                          )
                      )
             )
             
  )  ##-- Fin navbarPage #GoTSeason6
)

