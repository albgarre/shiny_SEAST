

library(shiny)
library(dplyr)
library(lubridate)
library(ggplot2)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
  
  
    ##-------------------------------------------------------------------------
    
    ## Tabla de tweets
  
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
   
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({
        
      
        
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$in_num_tweet))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    output$evolucion_tweet <- renderPlot ({

      grafica <- tweets_frame() %>%
        # filter(between(fecha, input$l_fecha[1], input$l_fecha[2])) %>%
        filter(fecha >= input$l_fecha[1]) %>%
        filter(fecha <= input$l_fecha[2]) %>%
        mutate(hora0 = cut(hora0,input$p_barras))
      
      grafica %>% ggplot(aes(x=hora0, fill = animo)) + geom_bar(position = "dodge")
      
    })
    
    
    ##-------------------------------------------------------------------------
    
})















