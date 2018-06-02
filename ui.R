#---------------------------------------------------------------------#
#                 Text Analysis App                              #
#---------------------------------------------------------------------#


shinyUI(
  fluidPage(
  
  titlePanel("Natural language Processing"),
  
  sidebarLayout(
    
      sidebarPanel(
        br(),
        fileInput("file",h3("Upload Text File")),
        p(span("Results population in tabs may take few secs",style = "color:blue")),
        br(),
        checkboxGroupInput("Upos",
                           label = h3("Select Universal Part-of-Speech"), 
                           choices = list("Adjective" = 'ADJ', 
                                          "Noun" = 'NOUN', 
                                          "Proper Noun" = 'PROPN',
                                          "Verb" = 'VERB',
                                          "Adverb" = 'ADV'),
                           selected = c('ADJ','NOUN','PROPN'))
        
       
        
    ),  # end of sidebar panel
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
      tabPanel("Overview",
      p(h4(strong(("NATURAL LANGUAGE PROCESSING (NLP)")))),
      p("Natural-language processing (NLP) is an area of computer science and artificial intelligence concerned with the interactions between computers and human (natural) languages, in particular how to program computers to process and analyze large amounts of natural language data.",align="justify"),
      a(href="https://en.wikipedia.org/wiki/Natural-language_processing","- Wikipedia"),
      br(),
      p(h4(strong("FEATURES "))),
      p("1. Reads any text file."),
      p("2. Supports English language input data only."),
      p("3. User can select list of Universal part-of-speech tags (upos) using check box in left panel for plotting co-occurrences."),
      p(strong("Please Note"),
      span("- Default selection is adjective (ADJ), noun (NOUN), proper noun (PROPN). ")),
      p("4. Based on upos selection, annotated document is filtered in Annotation tab and co-occurrences plot gets populated in Co-occurrences tab"),
      br(),   
      p(h4(strong("TABS "))),
      p(strong("Overview tab   -"),
        span("Gives overview of the application. ")),
      p(strong("Example dataset tab - 	"),
        span(" Has three sample files for downloading ")),
        
      p(strong("Annotation tab - 	"),
        span("Displays a table with 100 rows of annotated documents. "),
        span("User has option of downloading full annotated table as .csv file.")),
      p(strong("Wordcloud tab  -	"),
        span("Displays two wordclouds, one for all the nouns in the corpus and another for all the verbs in the corpus")),
      p(strong("Co-occurrences -	"),
        span("Displays a plot of top-30 co-occurrences at document level",align="justify"))
      
      
      ),
      tabPanel("Example dataset", h4(p("Download Sample for analysis")), 
               downloadButton('downloadData1', 'Download Sample file example 1'),br(),br(),
               downloadButton('downloadData2', 'Download Sample file example 2'),br(),br(),
               downloadButton('downloadData3', 'Download Sample file example 3'),br(),br(),
               
               p("Please note that download will not work with RStudio interface. Download will work only in web-browsers. So open this app in a web-browser and then download the example file. For opening this app in web-browser click on \"Open in Browser\" as shown below -"),
               img(src = "DownloadIssueWithApp.png")),
      
      tabPanel("Annotation",
               dataTableOutput('dout1'),
               downloadButton("download Data","Download Annotated Data")),
      
      tabPanel("Wordcloud Plots",
               h4('Nouns'),
               plotOutput('plot1'),
               h4('verbs'),
               plotOutput('plot2')),
  
      tabPanel("Co-occurrences Plot",
           plotOutput('plot3'))
               
      ) # end of tabsetPanel
          )# end of main panel
            ) # end of sidebarLayout
              )  # end if fluidPage
                ) # end of UI
  


