

library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
  
  ##-------------------------------------------------------------------------
  
  ##TAREA2: Rellenar para que tweets_frame sea reactivo
  
  n_tweet <- reactive(input$n_tweet)
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
      
      
      read.table(file_path,
                 header = TRUE,
                 sep = "\t",
                 stringsAsFactors = FALSE) %>% 
        mutate(.,
             anno = year(fecha),
             mes = month(fecha),
             dia = day(fecha),
             hora = hour(fecha),
             minuto = minute(fecha),
             hora0 = (dia - min(dia)) * 24 + hora + minuto/60)
      })
    
    ##---------------------------------------------------------------------
    
    ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
    
    ##---------------------------------------------------------------------

    output$tweets <- renderTable({
      return(head(tweets_frame(), n_tweet()))
    })
  
  ##-------------------------------------------------------------------------
  
  ##TAREA2: Implementar grafico de evolucion de tweets
  
  output$graf <- renderPlot({ 
    
    grafico <- tweets_frame() %>%
      filter(fecha>input$daterange[1] & fecha<input$daterange[2]) %>%
      mutate (hora0 = cut(hora0, input$slider)) %>%
      ggplot(aes(x = hora0 ,fill = animo)) +
      geom_bar(position = "dodge")
    
    return(grafico)
  })  
  
  ##-------------------------------------------------------------------------
  
})















