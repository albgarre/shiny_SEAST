

library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
    
    ##-------------------------------------------------------------------------
    
    ## Tabla de tweets
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    tweets_frame <- reactive({ #Lo que definimos aquí dentro son 
                               # variables reactivas.
      
      
      in_file <- input$in_file  # Accedemos al input
      
      file_path <- in_file$datapath  # in_file es una lista. El path esta en datapath.  
      
      if (is.null(in_file))
        return(NULL)
      
      read.table(file_path, header = TRUE,
                                        sep = "\t", stringsAsFactors = FALSE) %>%
                               mutate(.,
                                      anno = year(fecha),
                                      mes = month(fecha),
                                      dia = day(fecha),
                                      hora = hour(fecha),
                                      minuto = minute(fecha),
                                      hora0 = (dia - min(dia)) * 24 + hora + minuto/60)
      
      
      })
    
    
    output$tweets <- renderTable({
        
       
       
        
        
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$numfilas)) #Siempre que vaya a usar una variable
                                                     #por teclado usaré 'input$nombrevariable'

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    output$grafica<-renderPlot({
      
      mi_tabla <- tweets_frame()
      mi_tabla <- mi_tabla %>%
      filter(between(ymd_hms(fecha), ymd(input$fechas[1]),ymd(input$fechas[2])))
      ggplot(mi_tabla,aes(x=cut(hora ,input$deslizador),fill=animo)) + geom_bar(position='dodge')
    })
    ##-------------------------------------------------------------------------
    
})















