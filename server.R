
# Diego José Trias Ramos , 2016/2017.

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
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
       
  
  
      tweets_frame <- reactive({
        in_file <- input$in_file  # Accedemos al input
        
        if (is.null(in_file))
            {return(NULL)}
        else
        {
          file_path <- in_file$datapath  # in_file es una lista. El path esta en datapath.
        
          read.table(file_path, header = TRUE,
                                   sep = "\t", stringsAsFactors = FALSE) %>%
                        mutate(.,
                              anno = year(fecha),
                              mes = month(fecha),
                              dia = day(fecha),
                              hora = hour(fecha),
                              minuto = minute(fecha),
                              hora0 = (dia - min(dia)) * 24 + hora + minuto/60
                        )
          }          
        })
            
        
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
    output$tweets <- renderTable({    
      return(head(tweets_frame(), input$n_tweets))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    ##-------------------------------------------------------------------------
    output$evolucion  <- renderPlot({
      x <- tweets_frame()
      x <- x %>% 
        filter(fecha > input$intervalo[1] &
                                fecha < input$intervalo[2])
      x$hora0 <- cut(x$hora0, breaks = input$n_bins, na.rm = TRUE)
      
      
      ggplot(data = x, aes(x = hora0, fill = x$animo), na.rm = TRUE) +
        geom_bar(position = position_dodge(), na.rm = TRUE)+
        ylab("Número de tweets") +
        xlab("Intervalos")
      
    })
})















