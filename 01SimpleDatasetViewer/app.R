# import the shiny library
library(shiny)

#define user interface parameters

ui <- fluidPage(
  
  titlePanel("Select a Dataset"),
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  titlePanel("Summary Statistics of the Dataset:"),
  verbatimTextOutput("summary"),
  titlePanel("Dataset- Table"),
  tableOutput("table")
)

#define server parameters
server <- function(input, output, session){
  #define reactive expression
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$table <- renderTable({
    dataset()
  })
}

shinyApp(ui, server)

        
