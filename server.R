#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
shinyServer(
  function(input, output){
    output$rentalYield <- renderText({ calculateRentalYield(input$weeklyRent, input$price) })
    output$cashflowPerYear <- renderText({calculateYearlyCashflow(input$weeklyRent, input$waterPerQuarter, input$managementFees, input$weeklyRepayments)})
    output$cashflowPerWeek <- renderText({calculateWeeklyCashflow(input$weeklyRent, input$waterPerQuarter, input$managementFees, input$weeklyRepayments)})
  }
)

calculateRentalYield <- function (weeklyRent, propertyPrice) 
{
  result <- weeklyRent * 52 / propertyPrice * 100
  return(round(result, digits = 2))
}

calculateYearlyCashflow <- function(weeklyRent, water, managementFees, weeklyRepayments)
{
  result <- weeklyRent * 52 - (water) * 4 - managementFees * 52 - weeklyRepayments * 52
  return(round(result, digits = 2))
}

calculateWeeklyCashflow <- function(weeklyRent, water, managementFees, weeklyRepayments)
{
  result <- (weeklyRent * 52 - (water) * 4 - managementFees * 52 - weeklyRepayments * 52) / 52
  return(round(result, digits = 2))
}
