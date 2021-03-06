shinyUI(dashboardPage(
  # title of dashboard
  dashboardHeader(title='Boston Rentals'),
  # don't have a sidebar
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    # chart displaying points for apartments on map
    div(strong('Boston Apartments for Rent Colored by Price'), leafletOutput('rent_chart', height=300), 
    # panel housing controls of what you want to see
    absolutePanel(top = 50, right = 10,
                  # select model
                  selectInput("model", "Choose Model to Visualize",
                                 choices=c('Baseline Model', 'Regression Tree Model','Bagging Model',
                                           'Random forest Model','Boost Model',
                                           'Support vector regression','Actual Rent'),
                                         selected=1
                                    ),
                  # slider to select rental prices
                  sliderInput("rent", "Rent", floor(min(cdata$Actual.rent, na.rm=T)), ceiling(max(cdata$Actual.rent, na.rm=T)),
                              value = c(floor(min(cdata$Actual.rent, na.rm=T)), ceiling(max(cdata$Actual.rent, na.rm=T))), step = 1
                  ),
                  # slider to select number of bedrooms
                  sliderInput("bed", "Number of Bedrooms", 
                              0, 
                              6,
                              value = c(0, 6), step = 1
                  ), 
                  # slider to select square footage
                  sliderInput("sqft", "Square Footage", min(cdata$SqFt, na.rm=T), max(cdata$SqFt, na.rm=T),
                              value = range(cdata$SqFt, na.rm=T), step = 1
                  ), 
                  # # checkbox to show/hide legend
                  # checkboxInput("legend", "Show legend", TRUE), 
                  draggable=TRUE, class = "panel panel-default",
                  width=250
    )), 
    # add some space between plots
   p(), 
   p(), 
   div(strong('Residual of Rent Colored by Price'), leafletOutput('residual_chart', height=300), 
       # panel housing controls of what you want to see
       absolutePanel(top = 375, right = 10,
                     # select model
                     selectInput("res_model", "Choose Model to Visualize",
                                 choices=c('Baseline Res_Model', 'Regression Tree Res_Model','Bagging Res_Model',
                                            'Random forest Res_Model','Boost Res_Model',
                                 'Support vector regression Res_Model','Actual Rent'),
                                 selected=1
                     ),
                     # slider to select rental prices
                     sliderInput("res_rent", "Residual", -10000, 10000,
                                 value = c(-10000, 10000), step = 1
                     ),
                     # slider to select number of bedrooms
                     sliderInput("res_bed", "Number of Bedrooms", 
                                 0, 
                                 6,
                                 value = c(0, 6), step = 1
                     ), 
                     # slider to select square footage
                     sliderInput("res_sqft", "Square Footage", min(cdata$SqFt, na.rm=T), max(cdata$SqFt, na.rm=T),
                                 value = range(cdata$SqFt, na.rm=T), step = 1
                     ), 
                     # # checkbox to show/hide legend
                     # checkboxInput("legend", "Show legend", TRUE), 
                     draggable=TRUE, class = "panel panel-default",
                     width=250
       ))
    # # heatmap of predicted prices
    # div(strong('Heatmap of Predicted Rent for Apartments in Boston'), leafletOutput('pred_rent_heatmap', height=300), 
    #     # panel housing controls of what you want to see
    #     absolutePanel(top = 375, right = 10,
    #                   # select model
    #                   selectInput("hm_model", "Choose Model to Visualize", 
    #                               choices=c('Baseline Model', 'Original Random Intercept Model', 
    #                                         'Random Intercept Model with Zip', 
    #                                         'Nested Random Slope Model', 
    #                                         'Kriging Model'),
    #                               selected=1
    #                   ), 
    #                   # slider to select error
    #                   selectInput("hm_apt", "Apartment or House?", choices=unique(cdata$Apt.or.House),
    #                               selected=1
    #                   ),
    #                   # slider to select number of bedrooms
    #                   selectInput("hm_bed", "Number of Bedrooms", 
    #                               choices=seq(0, 
    #                                           max(as.numeric(as.character(cdata$Num.Bedrooms)), na.rm=T), by=1),
    #                               selected=1
    #                   ), 
    #                   # slider to select square footage
    #                   selectInput("hm_utilities", "Utilities Included?", choices=c('No', 'Yes'),
    #                               selected=1
    #                   ), 
    #                   selectInput("hm_single_unit", "Single Unit?", choices=c('No', 'Yes'),
    #                               selected=1
    #                   ), 
    #                   # # checkbox to show/hide legend
    #                   # checkboxInput("legend_hm", "Show legend", TRUE), 
    #                   draggable=TRUE, class = "panel panel-default",
    #                   width=250
    #     )),
    # # add some space between plots
    # p(), 
    # p(), 
    # # error for predicted rents
    # div(strong('Error for Predicted Rent for Apartments in Boston'), leafletOutput('sq_err_rent_chart', height=300), 
    # # panel housing controls of what you want to see
    # absolutePanel(top = 750, right = 10,
    #               # slider to select error
    #               sliderInput("err", "Error in Predicted Rent", floor(min(cdata$err_rent, na.rm=T)), ceiling(max(cdata$err_rent, na.rm=T)),
    #                           value = c(floor(min(cdata$err_rent, na.rm=T)), ceiling(max(cdata$err_rent, na.rm=T))), step = 1
    #               ),
    #               # slider to select number of bedrooms
    #               sliderInput("bed_err", "Number of Bedrooms", 
    #                           0, 
    #                           max(as.numeric(as.character(cdata$Num.Bedrooms)), na.rm=T),
    #                           value = c(0, max(as.numeric(as.character(cdata$Num.Bedrooms)), na.rm=T)), step = 1
    #               ), 
    #               # slider to select square footage
    #               sliderInput("sqft_err", "Square Footage", min(cdata$SqFt, na.rm=T), max(cdata$SqFt, na.rm=T),
    #                           value = range(cdata$SqFt, na.rm=T), step = 1
    #               ), 
    #               # # checkbox to show/hide legend
    #               # checkboxInput("legend_err", "Show legend", TRUE), 
    #               draggable=TRUE, class = "panel panel-default",
    #               width=250
    # ))
    ) #body
  )) #page,shinyUI
