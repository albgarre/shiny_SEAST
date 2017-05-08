

library(shiny)
library(dplyr)
library(lubridate)
library(ggplot2)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
    
    ##-------------------------------------------------------------------------
  tweets_frame <- reactive({
    
    in_file <- input$in_file  # Accedemos al input
    
    if (is.null(in_file))
      return(NULL)
    
    file_path <- in_file$datapath 
    
    read.table(file_path, header = TRUE, sep = "\t", stringsAsFactors = FALSE) %>% 
      mutate(.,
             anno = year(fecha),
             mes = month(fecha),
             dia = day(fecha),
             hora = hour(fecha),
             minuto = minute(fecha),
             hora0 = (dia - min(dia)) * 24 + hora + minuto/60
      )
    
    })
  
    ## Tabla de tweets
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({
      
    
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), n = input$n_tweets))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    ##-------------------------------------------------------------------------
    
    output$fechatweets  <- renderPlot({
      
      evolucion <- tweets_frame()
      evolucion <- filter(evolucion, fecha>input$fechas[1] & fecha<input$fechas[2])
      
      
      evolucion$hora0 <- cut(evolucion$hora0, input$num_barra)
      
      ggplot(evolucion, aes(hora0, color=animo, fill=animo)) +
        geom_bar(position="dodge") + ylab("Número de tweets")
      
    })
    
    
    
})















