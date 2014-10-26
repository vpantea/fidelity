library(shiny)

shinyUI(
	pageWithSidebar(
		headerPanel("Fidelity Prediction"),
		
		sidebarPanel(
			sliderInput("rating", 
				"Marriage Rating (1=very unhappy...5=very happy):", 
				value = 3,
				min = 1, 
				max = 5),
				
			sliderInput("age", 
				"Age:", 
				value = 38,
				min = 18, 
				max = 70),
				
			sliderInput("yearsmarried", 
				"Years Married:", 
				value = 3,
				min = 1, 
				max = 50),
				
			sliderInput("religiousness", 
				"Religiousness (1=anti...5=very religious):", 
				value = 3,
				min = 1, 
				max = 5),
      
			actionButton("predictButton", "Predict")
),

		mainPanel(
			h3('Results of prediction'),
			h4('You entered:'),
			p('Marriage Rating:'),
			verbatimTextOutput("rating"),
			p('Age:'),
			verbatimTextOutput("age"),
			p('Years Married:'),
			verbatimTextOutput("yearsmarried"),
			p('Religiousness:'),
			verbatimTextOutput("religiousness"),
			
			
			h4('Which resulted in a prediction of '),
			verbatimTextOutput("prediction")		)
	)
)