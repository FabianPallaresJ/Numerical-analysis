#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(deSolve)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$modSI <- renderPlot({
        if (input$num_host <input$ini_infect){
            output$error <- renderText({ 
                ("<font color=\"#FF0000\"><br><br><br><br><br><br><br>ERROR:<br> EL NÚMERO DE INFECTADOS DEBE SER MENOR AL NÚMERO DE HOST</font>") 
                
            })
        }
        else{
            
            output$error <- renderText({(" ")})
            
            N = 1
            #estado inicial de los compartimentos
            init <- c(S = input$num_host - input$ini_infect,
                      I = input$ini_infect)
            param <- c(beta = input$tasa_infect,
                       gamma = 0)
            
            sir <- function(times, init, param) {
                with(as.list(c(init, param)), {
                    #ecuaciones diferenciales   
                    dS <- -beta * S * I/(S+I)
                    dI <-  beta * S * I/(S+I)
                    #resultados de las tasas de cambio    
                    return(list(c(dS, dI)))
                })
            }
            times <- seq(0, 24, by = 1)
            #resolver el sistema de ecuaciones con función 'ode'
            if(input$method_si == 1){
                out <- ode(y = init, times = times, func = sir, parms = param,
                           method = "euler")
            }
            
            
            if(input$method_si == 2){
                out <- ode(y = init, times = times, func = sir, parms = param,
                           method = "rk4")
            }
            
            
            output$estint1<- renderText({ 
                ("<br>")
                
            })
            output$estint2<- renderText({ 
                ("<br>")
                
            })
            output$estint3<- renderText({ 
                ("<br>")
                
            })
            
            if(input$tasa_infect == 0 || input$ini_infect == 10){
                output$si_est<- renderText({ 
                    ("Aún no se tienen datos suficientes")
                    
                })
            }else{
                output$si_est<- renderText({ 
                    ("")
                })
                nRowsDf <- nrow(out)
                #Infectados > suceptibles
                for(i in 1:nRowsDf){
                    if(out[i,2] < out[i,3]){
                        output$si_est1<- renderText({ 
                            paste("- El número de infectados supera el
                            numero de suceptibles apriximadamente en la hora", 
                                  (i-2 + i-1) /2)
                            
                        })
                        break;
                    }
                }
                if(input$method_si == 1){
                    output$errores <- renderText({ 
                        ("<font color=\"#16a085\"><br>El error promedio relativo calculado para el método de euler
                     contrastando con los valores de infección en la fuente es del <b>2.22%</b></font>") 
                        
                    })
                }
                else if (input$method_si == 2){
                    output$errores <- renderText({ 
                        ("<font color=\"#16a085\"><br>El error promedio relativo calculado para el método de euler
                     contrastando con los valores de infección en la fuente es del <b>1.67%</b></font>") 
                        
                    })
                }
                
                
            }
            
            
            output$si_ode_values <- renderPrint(out) 
            #cambiar out a un data.frame
            out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
            #eliminar la variable 'time' en out
            out$time <- NULL
            
            y = (input$num_host + input$ini_infect)/2
            
            matplot(x = times, y = out, type = "l",
                    xlab = "Tiempo (horas)", ylab = "S, I", main = "Modelo SI",
                    lwd = 1, lty = 1, bty = "l", col = 2:4)
            #añadir leyenda de líneas
            legend(20,y, c("Susceptibles", "Infectados"), 
                   pch = 1, col = 2:4, bty = "n", cex = 1)
        }
    })

    
    output$modSIR <- renderPlot({
        if (input$sir_num_host <input$sir_ini_infect){
            output$errorSIR <- renderText({ 
                ("<font color=\"#FF0000\"><br><br><br><br><br><br><br>ERROR:<br> EL NÚMERO DE INFECTADOS DEBE SER MENOR AL NÚMERO DE HOST</font>") 
                
            })
        }
        else{
            output$errorSIR <- renderText({(" ")})
            
            N = 1
            #estado inicial de los compartimentos
            init <- c(S = input$sir_num_host - input$sir_ini_infect,
                      I = input$sir_ini_infect,
                      R = 0)
            param <- c(beta = input$sir_tasa_infect,
                       gamma = input$sir_tasa_recup)
            
            sir <- function(times, init, param) {
                with(as.list(c(init, param)), {
                    #ecuaciones diferenciales   
                    dS <- -beta * S * I/(S+I)
                    dI <-  (beta * S * I/(S+I)) - gamma * I
                    dR <- gamma * I
                    #resultados de las tasas de cambio    
                    return(list(c(dS, dI, dR)))
                })
            }
            times <- seq(0, 24, by = 1)
            #resolver el sistema de ecuaciones con función 'ode'
            if(input$method_sir == 1){
                out <- ode(y = init, times = times, func = sir, parms = param,
                           method = "euler")
            }
            
            
            if(input$method_sir == 2){
                out <- ode(y = init, times = times, func = sir, parms = param,
                           method = "rk4")
            }
            
            output$estint1<- renderText({ 
                ("<br>")
                
            })
            output$estint2<- renderText({ 
                ("<br>")
                
            })
            output$estint3<- renderText({ 
                ("<br>")
                
            })
            output$estint4<- renderText({ 
                ("<br>")
                
            })
            output$estint5<- renderText({ 
                ("<br>")
                
            })
            output$estint6<- renderText({ 
                ("<br>")
                
            })
          
            if(input$sir_tasa_infect == 0 || input$sir_ini_infect == 10){
                output$est<- renderText({ 
                    ("Aún no se tienen datos suficientes")
                    
                })
            }else{
                output$est<- renderText({ 
                    ("")
                    
                })
                nRowsDf <- nrow(out)
                #Infectados > suceptibles
                for(i in 1:nRowsDf){
                    if(out[i,2] < out[i,3]){
                        output$est1<- renderText({ 
                            paste("- El número de infectados supera el
                            numero de suceptibles apriximadamente en la hora", 
                                  (i-2 + i-1) /2)
                            
                        })
                        break;
                    }
                }
                #Recuperados > suceptibles
                for(j in 1:nRowsDf){
                    if(out[j,4] > out[j,2]){
                        output$est2<- renderText({ 
                            paste("- El número de recuperados supera el
                            numero de suceptibles aproximadamente en la hora",
                                  (j-2 + j-1) /2)
                        })
                        break;
                    }
                }
                #Recuperados > infectados
                for(k in 1:nRowsDf){
                    if(out[k,3] < out[k,4]){
                        output$est3<- renderText({ 
                            paste("- El número de recuperados supera el
                            numero de infectados apriximadamente en la hora",
                                  (k-2 + k-1) /2)
                            
                        })
                        break;
                    }
                }
                #Conclusiones
                output$est4<- renderText({ 
                    ("- El numero de infectados nunca llega a cero 
                             durante las primeras 24 horas")
                })
                for(l in 1:nRowsDf){
                    if(l == nRowsDf){
                        output$est5<- renderText({ 
                            paste("- El número de recuperados en la última hora es",
                            out[l,3])
                            
                        })
                    }
                }
                for(m in 1:nRowsDf){
                    if(m == nRowsDf){
                        output$est6<- renderText({ 
                            paste("- El número de infectados en la última hora es",
                            out[m,2])
                            
                        })
                    }
                }
                
                
                
                
            }
            
            
            output$ode_values <- renderPrint(out) 
            #cambiar out a un data.frame
            out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
            #eliminar la variable 'time' en out
            out$time <- NULL
            
            y = (input$sir_num_host + input$sir_ini_infect)/2
            
            matplot(x = times, y = out, type = "l",
                    xlab = "Tiempo (horas)", ylab = "S, I, R", main = "Modelo SIR",
                    lwd = 1, lty = 1, bty = "l", col = 2:4)
            #añadir leyenda de líneas
            legend(20,y, c("Susceptibles", "Infectados", "Recuperados"), 
                   pch = 1, col = 2:4, bty = "n", cex = 1)
        }
    })
    output$modSIS <- renderPlot({
        if (input$num_host_sis <input$ini_infect_sis){
            output$errorSIS <- renderText({ 
                ("<font color=\"#FF0000\"><br><br><br><br><br><br><br>ERROR:<br> EL NÚMERO DE INFECTADOS DEBE SER MENOR AL NÚMERO DE HOST</font>") 
                
            })
        }
        else{
            output$errorSIS <- renderText({(" ")})
            #estado inicial de los compartimentos
            
            X = input$num_host_sis-input$ini_infect_sis      # susceptible hosts
            Y = input$ini_infect_sis           # infectious hosts
            
            N = X + Y 
            
            initial_values = c (S = X/N,
                                I = Y/N)

            
            contact_rate = input$contactos_dia                   # number of contacts per day
            transmission_probability = input$tasa_infect_sis       # transmission probability
            infectious_period = 24                 # infectious period
            
            
            beta_value = contact_rate * transmission_probability
            gamma_value = 1 / infectious_period
            
            Ro = beta_value
            
            parameter_list = c (beta = beta_value,
                                gamma = gamma_value)
            
            timepoints <- seq(0, 24, by = 1)
            
            
            sis_model = function (current_timepoint, state_values, parameters)
            {
                # create state variables (local variables)
                S = state_values [1]        # susceptibles
                I = state_values [2]        # infectious
                
                with ( 
                    as.list (parameters),     # variable names within parameters can be used 
                    {
                        # compute derivatives
                        dS = (-beta * S * I) + (gamma * I)
                        dI = ( beta * S * I) - (gamma * I)
                        
                        # combine results
                        results = c (dS, dI)
                        list (results)
                    }
                )
            }
            
            
            output = lsoda (initial_values, timepoints, sis_model, parameter_list)
            #cambiar out a un data.frame
            output <- as.data.frame(output*N) #aqui puede multiplicar 'out' por N
            #eliminar la variable 'time' en out
            
            output$time <- NULL
            
            y = (input$num_host_sis + input$ini_infect_sis)/2
            
            matplot(x = timepoints, y = output, type = "l",
                    xlab = "Tiempo (horas)", ylab = "S, I, S", main = "Modelo SIS",
                    lwd = 1, lty = 1, bty = "l", col = 2:4)
            #añadir leyenda de líneas
            legend(20,y, c("Susceptibles", "Infectados"), 
                   pch = 1, col = 2:4, bty = "n", cex = 1)
            
            
            }
    })
    
    
})
