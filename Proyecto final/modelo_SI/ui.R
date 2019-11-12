#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(tabsetPanel(
    tabPanel("Modelo SI", titlePanel("Modelo de infección de CRv2 en servidores Microsoft IIS"),
             
             # Sidebar with a slider input for number of bins
             sidebarLayout(
                 sidebarPanel(
                     
                     # Input: Selector for choosing dataset ----
                     selectInput(inputId = "method_si",
                                 label = "Seleccione un método",
                                 choices = list("Euler" = 1, "Runge-kutta" = 2),
                                 selected = 1),
                     sliderInput(inputId = "num_host",
                                 label = "Total de hosts en el modelo:",
                                 min = 10,
                                 max = 500000,
                                 value = 1),
                     
                     sliderInput(inputId = "ini_infect",
                                 label = "Número inicial de infectados:",
                                 min = 10,
                                 max = 200000,
                                 value = 1),
                     
                     sliderInput(inputId = "tasa_infect",
                                 label = "Tasa de infección:",
                                 min = 0.0,
                                 max = 1,
                                 value = 0.00,
                                 step = 0.05),
                 ),
                 
                 # Show a plot of the generated distribution
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Gráfica",
                                  htmlOutput("error"),
                                  plotOutput("modSI")
                                  ),
                         tabPanel("Tabla",
                                  verbatimTextOutput("si_ode_values")),
                         tabPanel("Estadísticas",
                                  textOutput("si_est"),
                                  htmlOutput("si_estint1"),
                                  textOutput("si_est1"),
                                  htmlOutput("si_estint2"),
                                  textOutput("si_est2"),
                                  htmlOutput("si_estint3"),
                                  htmlOutput("errores")
                                  )
                     )
                     
                     
                     
                 )
             )),
    tabPanel("Modelo SIR", titlePanel("Modelo de infección SIR de CRv2 en servidores Microsoft IIS"),
             
             # Sidebar with a slider input for number of bins
             sidebarLayout(
                 sidebarPanel(
                     
                     # Input: Selector for choosing dataset ----
                     selectInput(inputId = "method_sir",
                                 label = "Seleccione un método",
                                 choices = list("Euler" = 1, "Runge-kutta" = 2),
                                 selected = 1),
                     sliderInput(inputId = "sir_num_host",
                                 label = "Total de hosts en el modelo:",
                                 min = 10,
                                 max = 500000,
                                 value = 1),
                     
                     sliderInput(inputId = "sir_ini_infect",
                                 label = "NÃºmero inicial de infectados:",
                                 min = 10,
                                 max = 200000,
                                 value = 1),
                     
                     sliderInput(inputId = "sir_tasa_infect",
                                 label = "Tasa de infección:",
                                 min = 0.0,
                                 max = 1,
                                 value = 0.00,
                                 step = 0.05),
                     sliderInput(inputId = "sir_tasa_recup",
                                 label = "Tasa de recuperación:",
                                 min = 0.0,
                                 max = 1,
                                 value = 0.00,
                                 step = 0.05),
                 ),
                 
                 # Show a plot of the generated distribution
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Gráfica",
                                  htmlOutput("errorSIR"),
                                  plotOutput("modSIR"),
                                  
                                  ),
                         tabPanel("Tabla",
                                  verbatimTextOutput("ode_values")

                         ),
                         tabPanel("Estadísticas",
                                  textOutput("est"),
                                  htmlOutput("estint1"),
                                  textOutput("est1"),
                                  htmlOutput("estint2"),
                                  textOutput("est2"),
                                  htmlOutput("estint3"),
                                  textOutput("est3"),
                                  htmlOutput("estint4"),
                                  textOutput("est4"),
                                  htmlOutput("estint5"),
                                  textOutput("est5"),
                                  htmlOutput("estint6"),
                                  textOutput("est6")
                         )
                     )
                     
                 )
             )),
    
    tabPanel("Modelo SIS", titlePanel("Modelo de infección SIS de CRv2 en servidores Microsoft IIS"),
             sidebarLayout(
                 sidebarPanel(
                     sliderInput(inputId = "num_host_sis",
                                 label = "Total de hosts en el modelo:",
                                 min = 10,
                                 max = 500000,
                                 value = 1),
                     
                     sliderInput(inputId = "ini_infect_sis",
                                 label = "Número inicial de infectados:",
                                 min = 10,
                                 max = 200000,
                                 value = 1),
                     
                     sliderInput(inputId = "contactos_dia",
                                 label = "Número de contactos por día:",
                                 min = 0.0,
                                 max = 5,
                                 value = 0.00,
                                 step = 0.5),
                     sliderInput(inputId = "tasa_infect_sis",
                                 label = "Tasa de infeccion",
                                 min = 0.0,
                                 max = 1,
                                 value = 0.00,
                                 step = 0.05),
                     
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Gráfica",
                                  htmlOutput("errorSIS"),
                                 plotOutput("modSIS"),
                                  
                         )
                 )
             )
             
             
             ))
    
)))
