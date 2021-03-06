# ---
# Title: "Shiny Server for TA Group AssignmentNo -2"
# Group Member names and ID No
# 
# 1.Ashutosh Kumar - 11910026
# 
# 2.Akshay Reddy  - 11910034
# 
# 3.Vinayak Karande - 11910039
# 
# ---


shinyServer(function(input, output) {
  
  Dataset <- reactive({
    if (is.null(input$file)) { return(NULL) }
    else{
      #Data = readLines('https://raw.githubusercontent.com/sudhir-voleti/sample-data-sets/master/text%20analysis%20data/amazon%20nokia%20lumia%20reviews.txt')
      Data <- readLines(input$file$datapath)
      Data  =  str_replace_all(Data, "<.*?>", "") # get rid of html junk 
      Data1 = Data[Data !=""]
      
      return(Data1)
    }
  })
  
  english_model = reactive({
    english_model = udpipe_load_model("english-ud-2.0-170801.udpipe")  # file_model only needed
    
    return(english_model)
  })
  
  annotation = reactive({
    temp <- udpipe_annotate(english_model(), x = Dataset()) #%>% as.data.frame() %>% head()
    temp <- as.data.frame(temp)
    
    return(temp)
  })
  
  
  output$`download Data`<-downloadHandler(
    filename = function()
    {
      "output_annotated_file.csv"
      
    },
    content=function(file){
      
      write.csv(annotation()[,-4],file,row.names = FALSE)
    }
    )
    
 output$dout1=renderDataTable({
   if (is.null(input$file)) { return(NULL) }
   else{
     x=input$rows
     
     temp=annotation()[,-4]
       return(temp)
   }
 })
  
  output$plot1=renderPlot(
    {
      if (is.null(input$file)) { return(NULL) }
      else{
        all_nouns=annotation()%>% subset(.,upos %in% "NOUN")
        top_nouns =txt_freq(all_nouns$lemma) #calculate noun freq in desc order
        wordcloud(top_nouns$key,top_nouns$freq,min.freq = 3,colors=1:10)
        }
    }
    
  )
 
  output$plot2=renderPlot(
    {
      if (is.null(input$file)) { return(NULL) }
      else{
        all_verbs=annotation()%>% subset(.,upos %in% "VERB")
        top_verbs =txt_freq(all_verbs$lemma) #calculate vebr freq in desc order
        wordcloud(top_verbs$key,top_verbs$freq,min.freq = 3,colors=1:10)
      }
    }
  )
  
  output$plot3=renderPlot(
    {
      if (is.null(input$file)) { return(NULL) }
      else{
        coocr <- cooccurrence(# try `?cooccurrence` for parm options
        x = subset(annotation(), upos %in% input$Upos), 
        term = "lemma", 
        group = c("doc_id", "paragraph_id", "sentence_id"))  # 0.02 secs
        wordnetwork <- head(coocr, 50)
        wordnetwork <- igraph::graph_from_data_frame(wordnetwork) # needs edgelist in first 2 colms.
        
        ggraph(wordnetwork, layout = "fr") +  
          
          geom_edge_link(aes(width = cooc, edge_alpha = cooc), edge_colour = "orange") +  
          geom_node_text(aes(label = name), col = "darkgreen", size = 4) +
          
          theme_graph(base_family = "Arial Narrow") +  
          theme(legend.position = "none") +
          
          labs(title = "Cooccurrences within 3 words distance")
      }
    }
  )
  
  # Download data files
  output$downloadData1 <- downloadHandler(
    filename = function() { "Game of Thrones IMDB reviews.txt" },
    content = function(file) {
      write.csv(read.csv("data/Game of Thrones IMDB reviews.txt"), file, row.names=F)
    }
  )
  output$downloadData2 <- downloadHandler(
    filename = function() { "ice-cream data.txt" },
    content = function(file) {
      write.csv(read.csv("data/ice-cream data.txt"), file, row.names=F)
    }
  )
  
  output$downloadData3 <- downloadHandler(
    filename = function() { "Iron man reviews.txt" },
    content = function(file) {
      write.csv(read.csv("data/Iron man reviews.txt"), file, row.names=F)
    }
  )
  
  
})


 
