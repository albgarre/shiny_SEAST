

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
        return(NULL)
      
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
    )
    
    output$tweets <- renderTable({
         
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$in_number))

    })
    

    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    output$fecha  <- renderPlot({
      
       mi_tabla <- tweets_frame()
       
       mi_tabla  <-
         filter(mi_tabla, fecha >input$restriccion[1] & fecha<input$restriccion[2])
       
      
      
      #mi_tabla$fechag <- cut(ymd_hms(mi_tabla$fecha), breaks = input$num_barra)
      mi_tabla$hora0 <- cut(mi_tabla$hora0, input$num_barra)
      
      ggplot(data=mi_tabla, aes(x=hora0, color=animo, fill=animo)) +
        geom_bar(position="dodge")
         
    })
    
    
    ##-------------------------------------------------------------------------
    
})















