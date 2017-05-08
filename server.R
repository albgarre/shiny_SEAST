

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
        
        read.table(file_path, header = TRUE,sep = "\t", stringsAsFactors = FALSE) %>%
          
          mutate(.,
                 anno = year(fecha),
                 mes = month(fecha),
                 dia = day(fecha),
                 hora = hour(fecha),
                 minuto = minute(fecha),
                 hora0 = (dia - min(dia)) * 24 + hora + minuto/60
          )
        
      })
        
      
      output$tweets <- renderTable({
      
      
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$in_number))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
      
      output$grafica <- renderPlot({
        
        tw <- tweets_frame()
        tw <- filter(tw, fecha>input$restriccion[1] & fecha<input$restriccion[2])
        
        
        grafica <- tw 
        
        grafica$hora0 <- cut(grafica$hora0, input$barra)
        
      
        ggplot(data=grafica, aes(x=hora0, color = animo, fill=animo)) +
          geom_bar(position = "dodge")
        
      })
    
    ##-------------------------------------------------------------------------
    
})















