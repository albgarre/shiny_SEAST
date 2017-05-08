

library(shiny)
library(dplyr)
library(lubridate)
library(ggplot2)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
  
    tweets_frame <- reactive({
      
      
      in_file <- input$in_file  # Accedemos al input
      
      if (is.null(in_file))
        return(NULL)
      
      file_path <- in_file$datapath  # in_file es una lista. El path esta en datapath.
      
      tweets_frame <- read.table(file_path, header = TRUE,
                                 sep = "\t", stringsAsFactors = FALSE) %>%
        mutate(.,
               anno = year(fecha),
               mes = month(fecha),
               dia = day(fecha),
               hora = hour(fecha),
               minuto = minute(fecha),
               hora0 = (dia - min(dia)) * 24 + hora + minuto/60
        )
      
    })
  
    ##-------------------------------------------------------------------------
    
    ## Tabla de tweets
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({

        
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$n_rows))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    output$diagram <- renderPlot({
      
      datos <- tweets_frame() %>% 
        filter(fecha > input$limits[1] & fecha < input$limits[2])
      
      datos$hora0 <- cut(datos$hora0, input$n_breaks)
      
      ggplot(datos, aes(x = hora0, color = animo, fill = animo)) +
        geom_bar(position ="dodge") + labs(x = "", y = "Numero de tweets")
      
    })
    
    ##-------------------------------------------------------------------------
    
})















