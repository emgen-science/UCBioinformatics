#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a boxplot
ui <- fluidPage(
   
   # Application title
   titlePanel("Cockroach dehydration project"),
   
   # Sidebar with a drop down box to choose the y axis variable 
   sidebarLayout(
      sidebarPanel(
         selectInput("yvariable",
                     label="Measurement:",
                     choices=c(
                     "Total Body Weight Lost" = "total.loss",
                     "Total Percent Body Weight Lost" = "total.percent",
                     "Average Body Weight Lost Per Day" = "avg.daily",
                     "Average Percent Body Weight Lost Per Day" = "avgdailypercent",
                     "Days Survived at 0% Relative Humidity" = "days.survived")
         )
      ),
      
      # Show the generated plot
      mainPanel(
         plotOutput("selecteddata")
      )
   )
)

# Define server logic required to draw a boxplot
server <- function(input, output) {
   
   output$selecteddata <- renderPlot({
      # the logic to set the Y-variable for our graph
     if (input$yvariable=="total.loss"){
       y=waterstats$total.loss
       yname="Total Body Weight Lost"
     }
     
     else if (input$yvariable=="total.percent"){
       y=waterstats$total.percent
       yname= "Total Percent Body Weight Lost"
     }
     
     else if (input$yvariable=="avg.daily"){
       y=waterstats$avg.daily
       yname="Average Body Weight Lost Per Day"
     }
     
     else if (input$yvariable=="avgdailypercent"){
       y=waterstats$avgdailypercent
       yname="Average Percent Body Weight Lost Per Day"
     }
     
     else {
       y=waterstats$days.survived
       yname="Days Survived at 0% Relative Humidity"
     }
       
      
      # ggplot boxplot
     #creates the ggplot object, fill= chooses what you fill based on
      ggplot(waterstats, aes(status,y,fill=status))+
        #adds the boxplot aesthetic
        geom_boxplot()+
        #adds the error bar stat (in ggplot it is a confidence interval)
        stat_boxplot(geom='errorbar')+
        #adding the xlabel
        xlab("Treatment Group")+
        #adding the ylabel which is chosen by our logic above
        ylab(yname)+
        #setting the "theme"
        theme(panel.background=element_rect(fill="white"),axis.line=element_line(size=.1,colour="black"),panel.grid=element_line(size=.01, colour="grey"))+
        #setting the breaks for our discrete binning system
        scale_fill_discrete(name="status", breaks=c("EL","EV","LL","LV"),labels=c("Early pregnancy", "Early virgin","Late pregnancy","Late virgin"))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

