library(shiny)
library(DT)
library(dplyr)

A <- c("Alpha", "Beta", "Gamma", "Delta")
B <- c("one","two","three","four")
C <- c("five","six","seven","eight")
Test_File <- as.data.frame(cbind(A,B,C))

ui <- basicPage(
  DT::dataTableOutput("table")
)

server <- function(input, output) {
  output$table <- DT::renderDataTable({
    data <- Test_File %>%
      dplyr::select(A,B) %>%
      dplyr::mutate(URL = paste0("https://www.testsite.com/abcdefg/", A)) %>%
      dplyr::mutate(URL = paste0("<a href='", URL, "'>",A,"</a>"))
  }, escape = FALSE)
}

shinyApp(ui, server)
