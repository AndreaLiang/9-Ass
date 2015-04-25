library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Mathemagic: Finding the Discarded Digit"),
        sidebarPanel(
                p("1. Think of a four-digit number. Call this number X"), 
                p("2. Add up the four digits of X and call this number Y. For example, if X is 1234, we have Y = 1 + 2 + 3 + 4 = 10"),
                p("3. Cross out a digit from 1 to 9 of X, so you are left with a three-digit number Z. For example, if X is 1234, and you decide to cross out 2, the number Z is 134"),
                p("4. Evaluate Z minus Y and enter it below "),
                textInput(inputId = "inputno", label = "Z - Y is:"),
                actionButton(inputId = "goButton", label = "Submit")
        ),
        mainPanel(
                h3("This is a guess-your-number mathemagic game."),
                p("First, you think of a four-digit number, then you perform certain operations on it, including removing a digit from the number. The specific instructions are in the sidebar panel."),
                p("After performing the requisite operations, you enter the result in the box in the sidebar panel."), 
                p("Even though you didn't tell me the original number, I'll be able to tell you which digit you eliminated during the operations."),
                p("It's magic!"),
                h2("The discarded digit is"),
                h2(textOutput("outputno"))
        )
))