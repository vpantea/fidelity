library(shiny)
library(AER)
data(Affairs, package="AER")
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair, levels=c(0,1), labels=c("No","Yes"))
model_glm.reduced <- glm(ynaffair ~ age + yearsmarried + religiousness + rating, data=Affairs, family=binomial())

fidelity <- function(rating, age, yearsmarried, religiousness) {
	predict_data <- data.frame(rating=rating, age=age, yearsmarried=yearsmarried, religiousness=religiousness)
	predict_data$prediction <- predict(model_glm.reduced, newdata=predict_data, type="response")
	predict_data$prediction
} 
 
shinyServer(
function(input, output) {
	output$rating <- renderText({
	  input$predictButton
    input$rating})	
	output$age <- renderText({
	  input$predictButton
    input$age})
	output$yearsmarried <- renderText({
	  input$predictButton
    input$yearsmarried})
	output$religiousness <- renderText({
	  input$predictButton
    input$religiousness})
	output$prediction <- renderText({
	  if(input$predictButton > 0)
		  fidelity(input$rating, input$age, input$yearsmarried, input$religiousness)
		})
})
	