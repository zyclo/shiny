#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Investment Property"),
  sidebarPanel(
    h4('Property'),
    textInput('text', 'Address', value=''),
    numericInput('price', 'Price ($)', 550000),
    numericInput('weeklyRent', 'Weekly Rent ($)', 550),
    h5('Costs'),
    numericInput('weeklyRepayments', 'Weekly Repayments ($ per week)', 503),
    numericInput('waterPerQuarter', 'Water ($ per quarter)', 180),
    numericInput('managementFees', 'Management Fees ($ per week)', 38)
  ),
  mainPanel(
    h4('Rental Yield (%)'),
    textOutput("rentalYield"),
    h4('Cashflow Per Week ($)'),
    textOutput("cashflowPerWeek"),
    h4('Cashflow Per Year ($)'),
    textOutput("cashflowPerYear"),
    br(),
    h4('Instructions'),
    helpText("This application is for designed to allow investors to calculate the potential rental yield of a property and estimate the cashflow of owning the property."),
    code("Rental Yield"),
    helpText("Enter the property's price and expected weekly rent to calculate the rental yield."),
    code("Cashflow"),
    helpText("Enter the property's costs to estimate the cashflow of owning the property.")
  )
))
