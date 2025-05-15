#importing the required libraries 
library(shiny)
library(shinyWidgets)
library(shinythemes)
library(ggplot2)

#importing the model
best_model <- readRDS("model.rds")

# Define UI
ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("Diabetes Risk Assessment Tool"),
  sidebarLayout(
    sidebarPanel(
      h4("Screening Test"),
      p("Use the tabs to navigate through different sections."),
      br(),
      h4("Enter Patient Data"),
      
      numericInput("Pregnancies", "Number of Pregnancies:", value = 4),
      numericInput("Glucose", "Blood Glucose Level:", value = 100),
      numericInput("SkinThickness", "SkinThickness:", value = 30),
      numericInput("Insulin", "Blood Insulin Level:", value = 100),
      numericInput("BMI", "Body Mass Index:", value = 24),
      numericInput("DiabetesPedigreeFunction", "Diabetes Pedigree Function:", value = 0.5),
      numericInput("Age", "How old are you:", value = 50),
      actionButton("predict", "Predict Risk", class = "btn-success")
    ),
    
    mainPanel(
      tabsetPanel(
        id = "main_tabs", #id for reference
        tabPanel("Overview",
                 h3("Diabetes Risk Assessment"),
                 p("This tool is designed to help predict the risk of developing 
                  Diabetes using the best machine learning model trained on a dataset of patient attributes."),
                 p("The sections include:"),
                 tags$ul(
                   tags$li("Risk Assessment - Enter patient data and get risk predictions."),
                   tags$li("Personalized Recommendations - Personalized recommendations are given by the model after risk Assessment to aid.")
                 ),
                 p("The model predicts whether a patient is at low, medium, or high risk of 
                   developing Diabetes based on input values. Personalized recommendations are suggested by 
                   the Model after risk assessment to aid interventions")
        ),
        
        tabPanel("Screening Test",
                 h3("Patient Risk Prediction"),
                 verbatimTextOutput("prediction"),
                 h3("Patient Visual Results"),
                 plotOutput("risk_plot"),
                 h3("Personalized Recommendations"),
                 verbatimTextOutput("recommendation")
        )
      )
    )
  ),
  tags$hr(),
  tags$footer(
    class = "footer",
    p(
      "Contact us: ",
      tags$a(href = "mailto:dataquestsolutions2@gmail.com", "dataquestsolutions2@gmail.com"),
      " | ",
      tags$a(
        href = "https://wa.me/254707612395?text=Hello%20I%20am%20interested%20in%20your%20services",
        target = "_blank",
        class = "whatsapp-link",
        icon("whatsapp"), "Chat on WhatsApp"
      )
    ),
    style = "text-align: right; margin: 20px", 
    "Powered By DataQuest Solutions"
  )
)

  


# Define Server
server <- function(input, output, session) {  
  # Predict Risk
  observeEvent(input$predict, {
    new_data <- data.frame(
      Pregnancies = input$Pregnancies,
      Glucose = input$Glucose,
      SkinThickness = input$SkinThickness,
      Insulin = input$Insulin,
      BMI = input$BMI,
      DiabetesPedigreeFunction = input$DiabetesPedigreeFunction,
      Age = input$Age
    )
    
    # Make prediction
    probability <- predict(best_model, new_data, type = "prob")[, "Yes"]
    risk_category <- ifelse(probability > 0.7, "High Risk",
                            ifelse(probability > 0.4, "Medium Risk", "Low Risk"))
    
    output$prediction <- renderText({
      paste("Predicted Risk:", risk_category, "| Probability:", round(probability * 100, 2), "%")
    })
    
    # Risk Categorization Plot
    output$risk_plot <- renderPlot({
      df <- data.frame(Category = c("Low Risk", "Medium Risk", "High Risk"),
                       Count = c(1, 1, 1))
      
      if (risk_category %in% df$Category) {
        df$Count[df$Category == risk_category] <- 5
      }
      
      ggplot(df, aes(x = Category, y = Count, fill = Category)) +
        geom_bar(stat = "identity") +
        labs(title = "Risk Categorization", x = "Risk Level", y = "Count") +
        theme_minimal()
    })
    
    general_recommendation <- switch(risk_category,
                                     "High Risk" = "Seek medical attention immediately. Lifestyle adjustments & monitoring advised.",
                                     "Medium Risk" = "Focus on diet, exercise & regular glucose screening.",
                                     "Low Risk" = "You are in excellent health! Keep up the good work. Continue healthy habits but schedule periodic health check-ups."
    )
    
    specific_recommendations <- c()
    
    if (input$Glucose > 140) {
      specific_recommendations <- c(specific_recommendations, "High glucose detected. Reduce sugar intake & monitor levels.")
    } else if (input$Glucose < 70) {
      specific_recommendations <- c(specific_recommendations, "Low glucose detected. Maintain balanced meals.")
    }
    
    if (input$BMI > 25) {
      specific_recommendations <- c(specific_recommendations, "High BMI detected. Weight management recommended i.e Engage in Physical Exercises")
    } else if (input$BMI < 18.5) {
      specific_recommendations <- c(specific_recommendations, "Low BMI detected. Nutritional assessment suggested.")
    }
    
    if (input$Insulin > 200) {
      specific_recommendations <- c(specific_recommendations, "High insulin detected. Possible insulin resistance. Consult a doctor.")
    } else if (input$Insulin < 50) {
      specific_recommendations <- c(specific_recommendations, "Low insulin detected. Ensure balanced carbohydrate intake.")
    }
    
    if (input$Age > 50) {
      specific_recommendations <- c(specific_recommendations, "Regular health check-ups recommended for aging adults.")
    }
    
    all_recommendations <- paste(c(general_recommendation, specific_recommendations), collapse = "\n")
    
    output$recommendation <- renderText({
      all_recommendations
    })
    
    #switch to the screening test
    updateTabsetPanel(session, "main_tabs", selected = "Screening Test")
    
  })
}

# Run the Shiny app
shinyApp(ui,server)


