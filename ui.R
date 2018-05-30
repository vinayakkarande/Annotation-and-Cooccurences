#---------------------------------------------------------------------#
#                 Text Analysis App                              #
#---------------------------------------------------------------------#


shinyUI(
  fluidPage(
  
  titlePanel("Text Analysis"),
  
  sidebarLayout(
    
      sidebarPanel(
        br(),
        fileInput("file",h3("Upload Text File")),
        br(),
        checkboxGroupInput("Upos",
                           label = h3("Select Upos for co-occurrences filtering"), 
                           choices = list("Adjective" = 'ADJ', 
                                          "Noun" = 'NOUN', 
                                          "Proper Noun" = 'PROPN',
                                          "Verb" = 'VERB',
                                          "Adverb" = 'ADV'),
                           selected = c('ADJ','NOUN','PROPN'))
        
       
        
    ),  # end of sidebar panel
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
      tabPanel("TEXT ANALYSIS APP",
      p(h2(div ("----------------- APP OVERVIEW -------------------",align="justify"))),
      h4(p("Input File")),
      p(h4("This App Supports only TEXT FILES",align="justify")),
      h4(p("How to use this APP"))),
   
      tabPanel("Annotation",
               dataTableOutput('dout1'),
               downloadButton("download Data","Download Annotated Data")),
      
      tabPanel("Wordcloud Plots",
               h4('Nouns'),
               plotOutput('plot1'),
               h4('verbs'),
               plotOutput('plot2')),
  
      tabPanel("Co-Occurrences Plot",
           plotOutput('plot3'))
               
      ) # end of tabsetPanel
          )# end of main panel
            ) # end of sidebarLayout
              )  # end if fluidPage
                ) # end of UI
  


