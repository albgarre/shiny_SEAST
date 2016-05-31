

library(shiny)
library(dplyr)
library(lubridate)
library(ggplot2)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
  
    
  
    tweets_frame <- reactive(
        read.table(input$in_file$datapath, header = TRUE,
                               sep = "\t", stringsAsFactors = FALSE) %>%
        mutate(.,
               anno = year(fecha),
               mes = month(fecha),
               dia = day(fecha),
               hora = hour(fecha),
               minuto = minute(fecha),
               hora0 = (dia - min(dia)) * 24 + hora + minuto/60
        ))
    
    ##-------------------------------------------------------------------------
    
    ## Tabla de tweets
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({

        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        x <- tweets_frame()
        
        return(head(x, input$in_n))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    output$histograma <- renderPlot({
      
      x <- tweets_frame()
      
      fecha_min <- input$daterange[1]
      fecha_max <- input$daterange[2]
      
      x <- x %>% filter(between(ymd_hms(fecha), ymd(fecha_min), ymd(fecha_max)))
      
      return(ggplot(data = x, aes(x = cut(hora0,input$sliderinput), fill = animo)) + geom_bar(position = "dodge"))
                               
    })
    
    ##-------------------------------------------------------------------------
    
})















