

library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
    
    ##-------------------------------------------------------------------------
    
    tweets_frame <- reactive({
    
      in_file <- input$in_file
    
      if(is.null(in_file))
        return(NULL)
    
      path <- in_file$datapath
    
      read.table(path, 
                 header = TRUE, 
                 sep = "\t", 
                 stringsAsFactors = FALSE) %>%
        mutate(.,
               anno = year(fecha),
               mes = month(fecha),
               dia = day(fecha),
               hora = hour(fecha),
               minuto = minute(fecha),
               hora0 = (dia - min(dia)) * 24 + hora + minuto/60
        )
    })
  
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({
      
      ##---------------------------------------------------------------------
      
      ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
      
      ##---------------------------------------------------------------------
      
      filas <- input$n_tweets
      return(head(tweets_frame(), n = filas))
      
      })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    ##-------------------------------------------------------------------------

    output$grafico_output <- renderPlot({
      
      grafico <- tweets_frame() %>%
        filter (fecha > input$daterange[1] & fecha < input$daterange[2]) %>%
        mutate (hora0 =  cut(hora0, input$slider)) %>%
        ggplot (aes(x = hora0, color = animo, fill = animo)) + 
        geom_bar (position = 'dodge') +
        ylab('Numero de tweets')
      
      return(grafico)
    })
    
})















