

library(shiny)
library(dplyr)
library(lubridate)

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
    
    read.table(input$in_file$datapath, header = TRUE,
               sep = "\t", stringsAsFactors = FALSE) %>%
      mutate(.,
             anno = year(fecha),
             mes = month(fecha),
             dia = day(fecha),
             hora = hour(fecha),
             minuto = minute(fecha),
             hora0 = (dia - min(dia)) * 24 + hora + minuto/60
      )})
  
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({
        
        
        
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$in_nro_tweets))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    output$grafico_evolucion <- renderPlot({
      
      tabla <- tweets_frame()
      
      
      tabla <- tabla %>% filter(between(ymd_hms(fecha), ymd(input$fechas[1]), ymd(input$fechas[2])))
      
      return(ggplot(data = tabla, aes(x = cut(hora0,input$breaks), fill = animo)) + geom_bar(position = "dodge"))
      
    })
    ##-------------------------------------------------------------------------
    
})















